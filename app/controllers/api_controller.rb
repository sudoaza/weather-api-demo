class ApiController < ActionController::API

  rescue_from ActionController::ParameterMissing do |e|
    render json: {error: e.message}, status: :bad_request
  end

end
