class Api::V1::Questions::MostlyAccessedController < Api::V1::ApiController

  def index
    render json: HotQuestionServices.call(maq_params(params)), status: :ok
  end

  def maq_params(params)
    params.permit(:week, :month, :year)
  end
end
