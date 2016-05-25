ActiveAdmin.register Customer do
  menu parent:'开街商城'
  permit_params :name, :description, :phone, admin_user_attributes: [:name, :email, :password, :password_confirmation], attachments_attributes: [:id, :image, :_destroy]

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :phone
    column :admin_user
    column :created_at
    actions
  end

  filter :description
  filter :name
  filter :phone
  filter :admin_user
  filter :created_at

  form do |f|
    f.inputs "商户详情" do
      f.input :name
      f.input :phone
      f.input :description

      if current_admin_user.admin? && f.object.new_record?
        f.inputs "商户管理员", for: [:admin_user, f.object.admin_user || AdminUser.new] do |a|
          a.input :name
          a.input :email
          a.input :password
          a.input :password_confirmation
        end
      end

      f.inputs '图片' do
        f.has_many :attachments, heading: false, allow_destroy: true do |a|
          a.input :image, as: :file, label: '图片(请上传尺寸为363 x 300)'
        end
      end
    end
    f.actions
  end
end
