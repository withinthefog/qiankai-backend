ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :role

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "详情" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      if current_admin_user.role == 'admin'
        f.input :role, as: :radio, collection: ['admin', 'customer']
      end
    end
    f.actions
  end

end
