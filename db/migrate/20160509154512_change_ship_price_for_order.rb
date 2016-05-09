class ChangeShipPriceForOrder < ActiveRecord::Migration
  def change
    change_column :orders, :ship_fee, :float
  end
end
