ActiveAdmin.register Product do
  permit_params :name, :image_url, :description, :price, :link, :hot

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :price
    column :hot
    column :created_at
    actions
  end

  filter :description
  filter :name
  filter :price
  filter :hot
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :image_url
      f.input :description
      f.input :price
      f.input :link
      f.input :hot
    end
    f.actions
  end

end
