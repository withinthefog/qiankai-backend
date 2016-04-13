class AddStockNumberToProducts < ActiveRecord::Migration
  def change
    add_column :products, :stock_number, :integer
  end
end
