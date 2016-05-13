class CreateTagCategories < ActiveRecord::Migration
  def change
    create_table :tag_categories do |t|
      t.string :display
      t.string :name
      t.timestamps null: false
    end
  end
end
