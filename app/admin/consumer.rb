ActiveAdmin.register Consumer do
  actions :index

  index do
    selectable_column
    id_column
    column :email
    column :user_name
    column :phone
    column :created_at
    actions
  end

  filter :email
  filter :user_name
  filter :phone
  filter :created_at
end
