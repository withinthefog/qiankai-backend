class CreateFreeShipmentCoupons < ActiveRecord::Migration
  def change
    create_table :free_shipment_coupons do |t|
      t.string :name
      t.integer :min_price
      t.timestamps null: false
    end
  end
end
