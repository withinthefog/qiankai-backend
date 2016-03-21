class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :receiver
      t.string :phone
      t.integer :city_id
      t.integer :province_id
      t.string :address
      t.string :city_name
      t.string :province_name
      t.timestamps null: false
    end
  end
end
