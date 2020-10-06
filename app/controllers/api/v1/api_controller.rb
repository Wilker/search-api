module Api::V1
  class ApiController < ApplicationController
    rescue_from(ActionController::ParameterMissing) do
      render json: {"status": 400,
                    "error": "Bad Request"}, status: :bad_request
    end
  end
end