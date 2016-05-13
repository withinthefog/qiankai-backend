ActiveAdmin.register FreeShipmentCoupon do
  menu parent: '订单管理'

  permit_params :name, :min_price
end
