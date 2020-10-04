class Discipline < ApplicationRecord
  has_many :questions

  validates :name, presence: true

  scope :hottest_questions, -> { Discipline.joins(:questions)
                                    .where(questions: {daily_access: Question.all.maximum(:daily_access)}) }
end
