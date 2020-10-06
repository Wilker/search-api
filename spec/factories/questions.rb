FactoryBot.define do
  factory :question do
    statement { Faker::Lorem.sentence }
    text { Faker::Lorem.sentence(word_count: rand(8..10)) }
    answer { %w[A B C D E].sample }
    daily_access { rand(99) }
    discipline { create :discipline }


    factory(:question_with_accesses) do
      question_accesses { create_list(:question_access, 10) }
    end
  end
end