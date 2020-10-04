namespace :questions do
  desc "Import Questions from JSON"
  task import_questions: :environment do

    questions_path = Rails.root.join("db", "files_import", "questions.json")
    questions = JSON.load(File.open(questions_path))

    disciplines = Discipline.all.pluck("name", "id").to_h

    puts "Importing #{questions.count} questions"

    ActiveRecord::Base.transaction do
      questions.each do |question|
        begin
          Question.create(set_discipline(question, disciplines))
          print "."
        rescue ActiveRecord::RecordNotUnique => err
          puts "\nfailed to import #{question}"
          puts err
        end
      end
    end
    puts " Finished!"
  end

  def set_discipline(question, disciplines)
    question.merge!("discipline_id" => disciplines[question["discipline"]])
    question.except!("discipline")
  end
end
