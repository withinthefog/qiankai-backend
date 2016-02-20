ActiveAdmin.register Job do
  menu parent:'便民生活'

  permit_params :title, :text, :company

  index do
    selectable_column
    id_column
    column :title
    column :company
    column :created_at
    actions
  end

  filter :title
  filter :text
  filter :company
  filter :created_at

  form do |f|
    f.inputs "就业信息详情" do
      f.input :title
      f.input :text, as: :rich, config: { width: '76%', height: '400px' }
      f.input :company
    end
    f.actions
  end

end
