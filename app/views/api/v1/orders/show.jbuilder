json.order do
  json.sn @order.sn
  json.state @order.state
  json.handle_state @order.handle_state
  json.total_price @order.total_price
  json.ship_fee @order.ship_fee
  json.created_at @order.created_at.strftime('%Y-%m-%d')

  json.line_items @order.line_items do |line_item|
    json.quantity line_item.quantity
    json.product do
      json.id line_item.product.id
      json.name line_item.product.name
      json.image line_item.product.product_images.size > 0 ? line_item.product.product_images[0].url : ''
      json.price line_item.product.price
    end
  end
end