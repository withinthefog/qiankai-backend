class ChangePriceFormatForLineItemAndOrder < ActiveRecord::Migration
  def change
    change_column :orders, :total_price, :float
    change_column :line_items, :unit_price, :float
  end
end
