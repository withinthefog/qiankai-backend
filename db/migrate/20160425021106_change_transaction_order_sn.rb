class ChangeTransactionOrderSn < ActiveRecord::Migration
  def change
    remove_column :transactions, :order_id
    add_column :transactions, :order_sn, :string
  end
end
