require 'rails_helper'

RSpec.describe QuestionAccess, type: :model do
  let(:question_access) { create :question_access }
  describe '#validations' do
    it "is valid with valid attributes" do
      expect(question_access).to be_valid
    end
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:times_accessed) }
    it { should validate_numericality_of(:times_accessed).only_integer }
    it { should validate_numericality_of(:times_accessed).is_greater_than_or_equal_to(0) }
  end
end
