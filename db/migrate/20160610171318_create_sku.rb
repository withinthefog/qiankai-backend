class CreateSku < ActiveRecord::Migration
  def change
    create_table :skus do |t|
      t.string :name
      t.float :price
      t.integer :product_id
      t.timestamps
    end
  end
end
