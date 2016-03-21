class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :consumer_id
      t.integer :address_id
      t.string  :state
      t.integer :total_price
      t.timestamps null: false
    end
  end
end
