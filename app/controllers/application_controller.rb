class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: exception.message }, status: :not_found
  end

  rescue_from ActionController::BadRequest do |_exception|
    render json: { error: 'Requisição inválida' }, status: :bad_request
  end
end
