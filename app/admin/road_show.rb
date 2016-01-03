ActiveAdmin.register RoadShow do
  menu parent:'众创空间'
  permit_params :name, :description, :video_link

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :video_link
    column :created_at
    actions
  end

  filter :name
  filter :description
  filter :video_link
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :description
      f.input :video_link
    end
    f.actions
  end

end
