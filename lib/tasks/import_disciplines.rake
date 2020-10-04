namespace :disciplines do
  desc "Import Questions from JSON"
  task import_disciplines: :environment do

    questions_path = Rails.root.join("db", "files_import", "questions.json")
    questions = JSON.load(File.open(questions_path))

    disciplines =  questions.pluck('discipline').uniq
    puts "Importing #{disciplines.count} disciplines"

    ActiveRecord::Base.transaction do
      disciplines.each do |discipline|
        begin
          Discipline.create(name: discipline)
          print "."
        rescue ActiveRecord::RecordNotUnique => err
          puts "\nfailed to import #{question}"
          puts err
        end
      end
    end
    puts " Finished!"
  end
end
