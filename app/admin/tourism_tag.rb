ActiveAdmin.register TourismTag do
  menu parent:'旅游'

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
    f.inputs "详情" do
      f.input :display
      f.input :name
    end
    f.actions
  end

end
