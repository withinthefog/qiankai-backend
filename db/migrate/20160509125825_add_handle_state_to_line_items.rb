class AddHandleStateToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :handle_state, :string, default: '未处理', null: false
  end
end
