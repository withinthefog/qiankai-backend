class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_consumer_from_token!
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :password_confirmation) }
  end

  private
  def authenticate_consumer_from_token!
    token = params[:token].presence
    consumer = token && Consumer.find_by_authentication_token(token.to_s)
    if consumer && consumer.id == params[:consumer_id].to_i
      sign_in consumer, store: false
    end
  end
end
