class Api::V1::ConsumersController < ApplicationController
  before_action :authenticate_consumer_from_token!
  before_action :authenticate_consumer!

  def show
    @consumer = current_consumer
  end

  def update

  end
end
