ActiveAdmin.register Order do
  menu parent:'订单管理'

  index do
    selectable_column
    column :id
    column :sn
    column :line_items do |order|
      order.line_items.map{|line_item| "商品ID: #{line_item.product.name}, 数量: #{line_item.quantity}"}.reduce('+')
    end
    column :consumer do |order|
      order.consumer.email if order.consumer.present?
    end
    column :address do |order|
      link_to order.address.city_name, admin_address_path(order.address) if order.address.present?
    end
    column :state
    column :total_price
    column :ship_fee
    column :created_at
    actions
  end

  filter :created_at
  filter :state
end
