class Api::V1::Questions::MostlyAccessedController < Api::V1::ApiController

  def index
    render json: MostlyAccessedQuestionsPresenter
                     .new(HotQuestionServices
                              .call(maq_params(params))).as_json, status: :ok
  end

  def maq_params(params)
    params.permit(:week, :month, :year)
  end
end
