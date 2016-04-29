class PingPPService
  def self.create_payment(order, client_ip, channel)
    Pingpp::Charge.create(
        order_no: order.sn,
        amount: (order.total_price + order.ship_fee) * 100,
        subject: order.consumer.openid,
        body: (order.line_items.map { |line_item| line_item.product.name }).to_json,
        channel: channel,
        currency: 'cny',
        client_ip: client_ip,
        extra: extra_field(order)[channel.to_sym],
        app: {id: ENV['PING_PP_KEY'] || "app_0qbv1GTurPWP9Gq1"}
    )
  end

  def self.extra_field(order)
    {
        wx_pub: {open_id: order.consumer.openid},
        wx_pub_qr: {product_id: order.sn}
    }
  end
end