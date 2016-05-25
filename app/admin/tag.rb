ActiveAdmin.register Tag do
  menu parent:'开街商城'

  permit_params :name, :display, :tag_category_id

  index do
    selectable_column
    id_column
    column :display
    column :name
    column :tag_category
    column :created_at
    actions
  end

  filter :display
  filter :name
  filter :tag_category
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :display
      f.input :name
      f.input :tag_category, as: :select, collection: TagCategory.all
    end
    f.actions
  end

end
