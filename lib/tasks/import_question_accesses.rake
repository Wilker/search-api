namespace :questions do
  desc "Import Questions Accesses from JSON"
  task import_question_accesses: :environment do

    question_access_path = Rails.root.join("db", "files_import", "question_access.json")
    question_accessess = JSON.load(File.open(question_access_path))

    puts "Importing #{question_accessess.count} questions accesses"
    ActiveRecord::Base.transaction do
      question_accessess.each do |question_access|
        begin
          QuestionAccess.create(question_access)
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
