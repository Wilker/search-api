require 'rails_helper'

RSpec.describe Api::V1::Disciplines::HottestQuestionsController, type: :request do
  describe '#index' do
    let!(:question1) { create(:question, daily_access: 100) }
    let!(:question2) { create(:question, daily_access: 30) }

    let(:parsed_body) { JSON.parse(response.body) }

    before(:each) { get api_v1_disciplines_hottest_questions_path }

    it { expect(response).to have_http_status(200) }

    it { expect(response.content_type).to eq('application/json; charset=utf-8') }

    it { expect(parsed_body["disciplines"]).to include(question1.discipline.name) }
  end
end