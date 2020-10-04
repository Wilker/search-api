require 'rails_helper'

RSpec.describe Discipline, type: :model do
  let(:discipline) { create :discipline }

  describe '#validations' do
    it "is valid with valid attributes" do
      expect(discipline).to be_valid
    end

    it { should validate_presence_of(:name) }
  end
end