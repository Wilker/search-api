class Api::V1::Disciplines::HottestQuestionsController < Api::V1::ApiController

  def index
    render json: Discipline.hottest_questions, status: :ok
  end
end