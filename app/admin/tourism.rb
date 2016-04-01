ActiveAdmin.register Tourism do
  menu parent:'旅游'
  permit_params :title, :description :content,
                attachments_attributes: [:id, :image, :_destroy]

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :content
    column :created_at
    actions
  end

  filter :title
  filter :description
  filter :created_at

  form do |f|
    f.inputs '景点详情' do
      f.input :title
      f.input :description
      f.input :content, as: :rich, config: { width: '76%', height: '400px' }
      f.inputs '图片' do
        f.has_many :attachments, heading: false, allow_destroy: true do |a|
          a.input :image, as: :file, hint: (a.template.image_tag(a.object.image.url(:small)) if a.object.image.exists? unless a.object.new_record?)
        end
      end
      f.input :tourism_tags, as: :check_boxes, collection: Tourism_Tag.all
    end
    f.actions
  end

end
