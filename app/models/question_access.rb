class QuestionAccess < ApplicationRecord
  belongs_to :question

  validates :date, :times_accessed, presence: true
  validates :times_accessed, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
