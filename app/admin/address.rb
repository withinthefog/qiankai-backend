ActiveAdmin.register Address do
  menu parent:'订单管理'
  index do
    column :id
    column :receiver
    column :phone
    column :address
    column :city_name
    actions
  end
end
