ActiveAdmin.register Order do
  menu parent:'订单管理'
  permit_params :state, :handle_state, :logistical, :logistical_number, :total_price, :ship_fee

  index do
    selectable_column
    column :id
    column :sn
    column :line_items do |order|
      order.line_items.map{|line_item| "商品ID: #{line_item.try(:product).try(:name)}, 数量: #{line_item.quantity}"}.reduce('+')
    end
    column :consumer do |order|
      order.consumer.openid ? "微信用户：#{order.consumer.nickname}" : order.consumer.email if order.consumer.present?
    end
    column :address do |order|
      link_to order.address.city_name, admin_address_path(order.address) if order.address.present?
    end
    column :state
    column :handle_state
    column :total_price
    column :ship_fee
    column :created_at
    actions
  end

  form do |f|
    f.inputs "订单详情" do
      f.input :state
      f.input :handle_state, as: :select, collection: ['未处理', '正在处理', '已发货', '已完成']
      f.input :logistical
      f.input :logistical_number
      f.input :total_price
      f.input :ship_fee
    end
    f.actions
  end

  filter :created_at
  filter :state
  filter :handle_state
end
