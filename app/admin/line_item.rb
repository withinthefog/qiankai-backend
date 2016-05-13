ActiveAdmin.register LineItem do
  menu parent:'订单管理'
  permit_params :state, :handle_state, :logistical, :logistical_number, :unit_price

  index do
    selectable_column
    column :id
    column :sn do |line_item|
      line_item.order.try(:sn)
    end
    column :product do |line_item|
      "商品ID：#{line_item.product_id}\n商品名称：#{line_item.try(:product).try(:name)}"
    end
    column :consumer do |line_item|
      (line_item.order.try(:consumer).try(:openid) ? "微信用户：#{line_item.order.try(:consumer).try(:nickname)}" : line_item.order.try(:consumer).try(:email)) if line_item.order.try(:consumer)
    end
    column :address do |line_item|
      (link_to line_item.order.address.city_name, admin_address_path(line_item.order.address)) if line_item.order.try(:address)
    end
    column :state do |line_item|
      line_item.order.try(:state)
    end
    column :handle_state
    column :unit_price
    column :quantity
    column :created_at
    actions
  end

  form do |f|
    f.inputs "订单详情" do
      f.input :handle_state, as: :select, collection: ['未处理', '正在处理', '已发货', '已完成']
      f.input :logistical
      f.input :logistical_number
      f.input :unit_price
    end
    f.actions
  end

  filter :created_at
  filter :state
  filter :handle_state
end
