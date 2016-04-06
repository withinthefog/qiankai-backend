ActiveAdmin.register TourismAdvertisement do
  permit_params :title, :link,
                attachments_attributes: [:id, :image, :_destroy]

  index do
    selectable_column
    id_column
    column :title
    column :link
    column :created_at
    actions
  end

  filter :title
  filter :link
  filter :created_at

  form do |f|
    f.inputs "资讯详情" do
      f.input :title
      f.input :link
      f.inputs '图片' do
        f.has_many :attachments, heading: false, allow_destroy: true do |a|
          a.input :image, as: :file, hint: (a.template.image_tag(a.object.image.url(:small)) if a.object.image.exists? unless a.object.new_record?)
        end
      end
    end
    f.actions
  end

end
