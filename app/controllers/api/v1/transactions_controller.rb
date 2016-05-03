class Api::V1::TransactionsController < ApiController
  before_action :authenticate_consumer_from_token!
  before_action :authenticate_consumer!

  def new
    if params[:sn].nil? || (order = Order.find_by_sn(params[:sn])).try(:consumer) != current_consumer || order.state == '已支付'
      @error = 'Invalid payment request'
      return render :error
    end

    if params[:channel].nil?
      @error = 'Channel not provided'
      return render :error
    end

    order = Order.find_by_sn(params[:sn])
    ip = request.remote_ip
    @charge = PingPPService.create_payment(order, ip, params[:channel], params[:success_url])
  end

  def create
    Transaction.create!(pingpp_id: params['id'],
                        order_sn: params['data']['object']['order_no'],
                       status: params['data']['object']['paid'],
                       transaction_type: params['type'],
                       amount: params['data']['object']['amount'])

    Order.find_by_sn(params['data']['object']['order_no']).update_attributes(state: '已支付')
    return render json: {status: 200}

  rescue Exception
    render json: {status: 500}
  end
end
