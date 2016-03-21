class Api::V1::AddressesController < ApplicationController
  before_action :authenticate_consumer!

  def index
    @addresses = current_consumer.addresses
  end

  def create
    byebug
  end
end
