class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories, options: 'ROW_FORMAT=DYNAMIC' do |t|
      t.string :display
      t.string :name
      t.timestamps
    end
  end
end
