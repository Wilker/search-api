require 'rails_helper'

RSpec.describe Api::V1::Questions::MostlyAccessedController, type: :request do
  describe '#index' do

    let(:parsed_body) { JSON.parse(response.body) }

    describe '#index' do
      context 'GET by week' do
        context 'with correct params' do
          let!(:question_access) { create(:question_access, date: Date.commercial(2020, 20)) }

          before(:each) { get api_v1_questions_mostly_accessed_index_path(year: 2020, week: 20) }

          it { expect(response).to have_http_status(:ok) }

          it { expect(response.content_type).to eq('application/json; charset=utf-8') }

          it { expect(parsed_body).
              to eq(MostlyAccessedQuestionsPresenter.new([question_access.question]).as_json) }
        end

        context 'with incorrect params' do
          let!(:question_access) { create(:question_access, date: Date.commercial(2020, 20)) }

          context 'without year' do
            before(:each) { get api_v1_questions_mostly_accessed_index_path(week: 20) }

            it { expect(response).to have_http_status(:bad_request) }
          end
        end
      end

      context 'GET by month' do
        context 'with correct params' do
          let!(:question_access) { create(:question_access, date: DateTime.new(2020, 10)) }

          before(:each) { get api_v1_questions_mostly_accessed_index_path(year: 2020, month: 10) }

          it { expect(response).to have_http_status(200) }

          it { expect(response.content_type).to eq('application/json; charset=utf-8') }

          it { expect(parsed_body).
              to eq(MostlyAccessedQuestionsPresenter.new([question_access.question]).as_json) }

        end

        context 'with incorrect params' do
          context 'with incorrect params' do
            let!(:question_access) { create(:question_access, date: Date.commercial(2020, 20)) }

            context 'without year' do
              before(:each) { get api_v1_questions_mostly_accessed_index_path(month: 10) }

              it { expect(response).to have_http_status(:bad_request) }
            end
          end
        end
      end

      context 'GET by year' do
        let!(:question_access) { create(:question_access, date: DateTime.new(2020, 10)) }

        before(:each) { get api_v1_questions_mostly_accessed_index_path(year: 2020) }

        it { expect(response).to have_http_status(200) }

        it { expect(response.content_type).to eq('application/json; charset=utf-8') }

        it { expect(parsed_body).
            to eq(MostlyAccessedQuestionsPresenter.new([question_access.question]).as_json) }

      end
    end
  end
end