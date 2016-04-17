class AddShipFeeAndSnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :ship_fee, :integer
    add_column :orders, :sn, :string
  end
end
