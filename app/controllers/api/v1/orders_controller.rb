class Api::V1::OrdersController < ApiController
  before_action :authenticate_consumer!

  def index
    @orders = Order.find_by_consumer_id(current_consumer.id)
  end

  def create
    total_price = 0

    line_items = order_params[:order][:products].map do |product_id, quantity|
      product = Product.find(product_id.to_i)
      total_price += product.price.to_f
      LineItem.create(product_id: product.id, quantity: quantity, unit_price: product.price.to_f)
    end

    order = Order.create(consumer_id: current_consumer.id, address_id: params[:order][:address_id], total_price: total_price)
    order.line_items << line_items
  end

  private
  def order_params
    params.require(:order).permit(:address_id, products:[:id, :quantity])
  end

end
