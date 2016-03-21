class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity
      t.integer :unit_price
      t.string  :state
      t.timestamps null: false
    end
  end
end
