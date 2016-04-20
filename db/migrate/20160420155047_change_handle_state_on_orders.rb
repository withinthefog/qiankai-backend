class ChangeHandleStateOnOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :handle_state
    add_column :orders, :handle_state, :string, default: '未处理', null: false
  end
end
