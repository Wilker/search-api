class Api::V1::Questions::MostlyAccessedController < Api::V1::ApiController

  def index
    render json: MostlyAccessedQuestionsPresenter
                     .new(HotQuestionServices
                              .get(most_acc_question_params(params))).as_json, status: :ok
  end

  def most_acc_question_params(params)
    params.require(:year)
    params.permit(:week, :month, :year)
  end
end
