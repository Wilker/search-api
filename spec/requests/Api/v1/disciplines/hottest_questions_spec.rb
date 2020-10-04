require 'rails_helper'

RSpec.describe Api::V1::Disciplines::HottestQuestionsController, type: :request do
  describe '#index' do
    before { get api_v1_disciplines_hottest_questions_path }
    it { expect(response).to have_http_status(200) }
  end
end