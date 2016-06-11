ActiveAdmin.register TagCategory do
  menu parent:'开街商城'

  permit_params :name, :display, :present_tag_id
end
