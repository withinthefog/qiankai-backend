class Api::V1::OrdersController < ApiController
  before_action :authenticate_consumer_from_token!
  before_action :authenticate_consumer!

  def index
    if(params[:sn].present?)
      @order = find_order_by_sn(params[:sn])
      return render :show
    end

    @orders = Order.includes(:address).includes(:line_items).includes(:products).where(consumer_id: current_consumer.id).order('created_at DESC')
  end

  def update
    @order = find_order_by_sn(params[:id])
    @order.update_attributes(order_update_params) if order_update_params[:state] == '支付中' && @order.state == '未支付'
    render :show
  end

  def delete
    @order = find_order_by_sn(params[:id])
  end

  def show
    @order = Order.find(params[:id].to_i)
    raise UnauthorizedException unless @order.try(:consumer_id) == current_consumer.id
  end

  def create
    total_price = 0

    line_items = order_params[:products].map do |item|
      quantity = item[:quantity]
      product = Product.find(item[:id].to_i)
      total_price += product.price.to_f * quantity
      LineItem.create(product_id: product.id, quantity: quantity, unit_price: product.price.to_f)
    end

    shipment_fee = total_price > FreeShipmentCoupon.last.min_price ? 0 : ShipmentFeeService.calculate(params[:order][:address_id])

    @order = Order.create(consumer_id: current_consumer.id,
                         address_id: params[:order][:address_id],
                         total_price: total_price,
                         state: '未支付',
                         ship_fee: shipment_fee,
                         sn: "#{DateTime.now.to_i}#{rand(9999)}")
    @order.line_items << line_items

    render :show
  end

  private
  def order_params
    params.require(:order).permit(:address_id, products: [:id, :quantity])
  end

  def order_update_params
    params.require(:order).permit(:state)
  end

  def find_order_by_sn(sn)
    raise ActiveRecord::RecordNotFound, "Can not find order" unless sn
    @order = Order.find_by_sn(sn)
    raise ActiveRecord::RecordNotFound, "Can not find order with sn #{params[:sn]}" unless @order
    raise UnauthorizedException unless @order.try(:consumer_id) == current_consumer.id
    @order
  end

end
