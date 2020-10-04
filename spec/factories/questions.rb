FactoryBot.define do
  factory :question do
    statement { Faker::Lorem.sentence }
    text { Faker::Lorem.sentence(word_count: rand(8..10)) }
    answer { %w[A B C D E].sample }
    daily_access { rand(99) }
    discipline { create :discipline }
  end
end