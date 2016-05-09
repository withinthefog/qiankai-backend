class AddHandleStateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :handle_state, :string, default: '未处理', null: false
  end
end
