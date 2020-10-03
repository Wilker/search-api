require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { create :question }
  describe '#validations' do
    it "is valid with valid attributes" do
      expect(question).to be_valid
    end
    it { should validate_presence_of(:statement) }
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:answer) }
    it { should validate_presence_of(:daily_access) }
    it { should validate_presence_of(:discipline) }
    it { should validate_numericality_of(:daily_access).only_integer }
    it { should validate_numericality_of(:daily_access).is_greater_than_or_equal_to(0) }
  end
end
