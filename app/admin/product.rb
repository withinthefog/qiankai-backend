ActiveAdmin.register Product do
  menu parent:'商品'

  permit_params :name, :image_url, :description, :price, :link, :hot, :product_detail, :customer_id, :service, tag_ids: [], attachments_attributes: [:id, :image, :_destroy]

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
      f.input :description
      f.input :price
      f.input :tags, as: :check_boxes, collection: Tag.all
      if current_admin_user.admin?
        f.input :customer, as: :select, collection: Customer.all
      else
        f.input :customer_id, :input_html => { value: current_admin_user.customer_id }, as: :hidden
      end
      f.inputs '图片' do
        f.has_many :attachments, heading: false, allow_destroy: true do |a|
          a.input :image, as: :file, hint: (a.template.image_tag(a.object.image.url(:small)) if a.object.image.exists? unless a.object.new_record?)
        end
      end
      f.input :product_detail, as: :file
      f.input :service, as: :file
    end
    f.actions
  end

end
