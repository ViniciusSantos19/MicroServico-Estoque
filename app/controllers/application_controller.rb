class ApplicationController < ActionController::API
  before_action :authorize_request

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: exception.message }, status: :not_found
  end

  rescue_from ActionController::BadRequest do |_exception|
    render json: { error: 'Requisição inválida' }, status: :bad_request
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decoded = decoded_tooken(header)
    render json: { error: 'unautrhorized request' }, status: :unauthorized unless decoded
  end

  def decoded_tooken(token)
    jwt_secret = ENV['SECRET_KEY_BASE']
    JWT.decode(token, jwt_secret, true, algorithm: 'HS512')
  rescue JWT::DecodeError
    nil
  end
end
