class PingPPService
  def self.create_payment(order, client_ip, open_id)
    Pingpp::Charge.create(
        order_no: order.sn,
        amount: order.total_price + order.ship_fee,
        subject: order.consumer.email,
        body: (order.line_items.map{|line_item| line_item.product.name}).to_json,
        channel: 'wx_pub',
        currency: 'cny',
        client_ip: client_ip,
        open_id: open_id,
        app: {id: "app_0qbv1GTurPWP9Gq1"}
    )
  end
end