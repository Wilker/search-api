class Api::V1::Disciplines::HottestQuestionsController < Api::V1::ApiController

  def index
    render json: HottestQuestionsDisciplinesPresenter.new(Discipline.hottest_questions).as_json, status: :ok
  end
end