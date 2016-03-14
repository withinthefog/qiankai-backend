ActiveAdmin.register Tag do
  menu parent:'商品'

  permit_params :name, :display

  index do
    selectable_column
    id_column
    column :display
    column :name
    column :created_at
    actions
  end

  filter :display
  filter :name
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :display
      f.input :name
    end
    f.actions
  end

end
