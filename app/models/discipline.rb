class Discipline < ApplicationRecord
  has_many :questions

  validates :name, presence: true
end
