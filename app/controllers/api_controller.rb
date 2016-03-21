class ApiController < ApplicationController
  respond_to :json

  acts_as_token_authentication_handler_for Consumer
end
