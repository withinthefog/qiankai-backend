class Api::V1::CustomersController < ApiController

  def index
    @customers = Customer.all
  end

  def show
    @customer_name = Customer.find(params[:id].to_i).try(:name)
    @products = Product.where(customer_id: params[:id].to_i)
  end

end
