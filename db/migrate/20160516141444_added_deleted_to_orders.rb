class AddedDeletedToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :deleted, :boolean, default: false, null: false
  end
end
