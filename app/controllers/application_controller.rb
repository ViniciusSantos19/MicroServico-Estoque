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

  if header && header.split(' ').length == 2
    token = header.split(' ').last
    Rails.logger.info "JWT Token: #{token}"
    Rails.logger.info "JWT Secret: #{ENV['SECRET_KEY_BASE']}"
    decoded = decoded_token(token)

    if decoded
      Rails.logger.info "Decoded JWT: #{decoded.inspect}"
    else
      Rails.logger.warn "Failed to decode JWT: #{token}"
    end

    render json: { error: 'unauthorized request' }, status: :unauthorized unless decoded
  else
    render json: { error: 'missing or malformed Authorization header' }, status: :unauthorized
  end
end

def decoded_token(token)
  jwt_secret = ENV['SECRET_KEY_BASE']
  begin
    JWT.decode(token, jwt_secret, true, algorithm: 'HS256')
  rescue JWT::DecodeError => e
    Rails.logger.error "Failed to decode JWT: #{e.message}"
    nil
  end
end
end
