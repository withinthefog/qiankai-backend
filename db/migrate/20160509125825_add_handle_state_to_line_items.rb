class AddHandleStateToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :handle_state, :string
  end
end
