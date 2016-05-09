class AddLogisticalAndLogisticalNumberToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :logistical, :string
    add_column :line_items, :logistical_number, :string
  end
end
