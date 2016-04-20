class AddHandleStateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :handle_state, :string
  end
end
