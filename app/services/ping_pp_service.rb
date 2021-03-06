class PingPPService
  def self.create_payment(order, client_ip, channel, success_url=nil)
    Pingpp::Charge.create(
        order_no: order.sn,
        amount: (order.total_price + order.ship_fee) * 100,
        subject: '开街网订单',
        body: (order.line_items.map { |line_item| line_item.product.name }).to_json,
        channel: channel,
        currency: 'cny',
        client_ip: client_ip,
        extra: extra_field(order, success_url)[channel.to_sym],
        app: {id: ENV['PING_PP_KEY'] || "app_0qbv1GTurPWP9Gq1"}
    )
  end

  def self.extra_field(order, success_url=nil)
    {
        wx_pub: {open_id: order.consumer.openid},
        wx_pub_qr: {product_id: order.sn},
        alipay_pc_direct: {success_url: success_url},
        wx: {success_url: success_url}
    }
  end
end