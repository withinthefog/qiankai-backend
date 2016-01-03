class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products, options: 'ROW_FORMAT=DYNAMIC' do |t|
      t.string :name
      t.string :image_url
      t.string :description
      t.string :price
      t.timestamps
    end
  end
end
