class AddLogisticalAndLogisticalNumberToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :logistical, :string
    add_column :orders, :logistical_number, :string
  end
end
