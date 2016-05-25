class Api::V1::PaymentMethodsController < ApiController
  def index
    @payment_methods = PaymentMethod.all
  end
end