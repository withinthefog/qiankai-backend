ActiveAdmin.register Customer do
  permit_params :name, :description, admin_user_attributes: [:name, :email, :password, :password_confirmation], attachments_attributes: [:id, :image, :_destroy]

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :admin_user
    column :created_at
    actions
  end

  filter :description
  filter :name
  filter :admin_user
  filter :created_at

  form do |f|
    f.inputs "商户详情" do
      f.input :name
      f.input :description

      f.inputs "商户管理员", for: [:admin_user, f.object.admin_user || AdminUser.new] do |a|
        a.input :name
        a.input :email
        a.input :password
        a.input :password_confirmation
      end

      f.inputs '图片' do
        f.has_many :attachments, heading: false, allow_destroy: true do |a|
          a.input :image, as: :file, hint: (a.template.image_tag(a.object.image.url(:small)) if a.object.image.exists? unless a.object.new_record?)
        end
      end
    end
    f.actions
  end
end
