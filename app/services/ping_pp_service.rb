class PingPPService
  def self.create_payment(order, client_ip)
    Pingpp::Charge.create(
        order_no: order.sn,
        amount: (order.total_price + order.ship_fee) * 100,
        subject: order.consumer.openid,
        body: (order.line_items.map { |line_item| line_item.product.name }).to_json,
        channel: 'wx_pub',
        currency: 'cny',
        client_ip: client_ip,
        extra: {open_id: order.consumer.openid},
        app: {id: ENV['PING_PP_KEY'] || "app_0qbv1GTurPWP9Gq1"}
    )
  end
end