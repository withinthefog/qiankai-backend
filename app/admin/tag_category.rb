ActiveAdmin.register TagCategory do
  menu parent:'商品'

  permit_params :name, :display, :present_tag_id
end
