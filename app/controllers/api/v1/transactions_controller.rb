class Api::V1::TransactionsController < ApiController
  before_action :authenticate_consumer!

  def new
    if params[:sn].nil? || (order = Order.find_by_sn(params[:sn])).consumer != current_consumer || order.state == '已支付'
      @error = 'Invalid payment request'
      return render :error
    end

    order = Order.find_by_sn(params[:sn])
    ip = request.remote_ip
    @charge = PingPPService.create_payment(order, ip)
  end

  def create
    puts params
  end
end
