class TransactionController < ApiController
  before_action :authenticate_consumer!

  def new
    @error = 'Invalid payment request' if params[:sn].nil? || (order = Order.find_by_sn(params[:sn])).consumer != current_consumer || order.state == '已支付'
    return render :error

    order = Order.find_by_sn(params[:sn])
    ip = request.remote_ip
    @charge = PingPPService.create_payment(order, ip)
  end

  def create
  end
end
