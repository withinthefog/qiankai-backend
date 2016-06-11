class AddOrderNumberToProducts < ActiveRecord::Migration
  def change
    add_column :products, :display_order, :integer, null: false, default: 0
  end
end
