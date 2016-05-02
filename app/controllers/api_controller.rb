class ApiController < ApplicationController
  respond_to :json

  rescue_from UnprocessableEntityException, with: :handle_unprocessable_exception
  rescue_from ActionController::RoutingError, with: :handle_route_error
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found_exception
  rescue_from UnauthorizedException, with: :handle_unauthorized_exception
  rescue_from Pingpp::InvalidRequestError, with: :handle_ping_pp_invalid_request

  private
  def handle_record_not_found_exception(exception)
    logger.info("Record not found: #{exception.message}")
    render json: {message: "record not found:  #{exception.message}"}.to_json, status: 404
  end

  def handle_unauthorized_exception(exception)
    logger.info("Not authorized to this operation: #{exception.message}")
    render json: {message: exception.message}.to_json, status: 401
  end

  def handle_ping_pp_invalid_request(exception)
    logger.info("Invalid ping pp request: #{exception.message}")
    render json: {message: exception.message}.to_json, status: 422
  end

  def handle_route_error(exception)
    Rails.logger.info("#{exception}: #{exception.message}")
    render json: {message: "this api dose not exist: #{exception.message}"}.to_json, status: 404
  end

  def handle_unprocessable_exception(exception)
    byebug
    logger.info("Unprocessable request: #{exception.message}")
    render json: {message: exception.message, code: exception.code}.to_json, status: 422
  end
end
