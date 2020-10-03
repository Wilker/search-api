FactoryBot.define do
  factory :question_access do
    date { Faker::Date.between(from: 1.year.ago, to: Date.today)}
    times_accessed {rand(0..99999)}
    question { create :question }
  end
end
