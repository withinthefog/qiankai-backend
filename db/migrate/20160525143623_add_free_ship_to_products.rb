class AddFreeShipToProducts < ActiveRecord::Migration
  def change
    add_column :products, :free_ship, :boolean, null: false, default: false
  end
end
