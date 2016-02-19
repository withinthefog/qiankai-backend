ActiveAdmin.register Job do
  permit_params :title, :description, :company

  index do
    selectable_column
    id_column
    column :title
    column :company
    column :created_at
    actions
  end

  filter :title
  filter :description
  filter :company
  filter :created_at

  form do |f|
    f.inputs "就业信息详情" do
      f.input :title
      f.input :description, as: :rich, config: { width: '76%', height: '400px' }
      f.input :company
    end
    f.actions
  end

end
