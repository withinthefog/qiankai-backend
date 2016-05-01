ActiveAdmin.register VirtualTourism do
  menu parent:'旅游'
  permit_params :title, :description, :video

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :video do |video|
        image_tag video.video_thumb
      end
      row :created_at
      row :updated_at
    end
  end

  filter :title
  filter :description
  filter :created_at

  form do |f|
    f.inputs '虚拟旅游详情' do
      f.input :title
      f.input :description
      f.input :video, as: :file, hint: (f.image_tag(f.object.video_thumb) if f.object.video.exists? unless f.object.new_record?)
    end
    f.actions
  end

end
