class CreateShipmentFees < ActiveRecord::Migration
  def change
    create_table :shipment_fees do |t|
      t.integer :province_id
      t.integer :city_id
      t.string :destination_name
      t.float :price
      t.timestamps null: false
    end
  end
end
