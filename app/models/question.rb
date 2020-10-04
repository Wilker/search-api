class Question < ApplicationRecord
  has_many :question_accesses
  belongs_to :discipline

  validates :statement, :text, :answer, :daily_access, :discipline, presence: true
  validates :daily_access, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
