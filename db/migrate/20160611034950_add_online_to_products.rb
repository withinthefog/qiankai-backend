class AddOnlineToProducts < ActiveRecord::Migration
  def change
    add_column :products, :on_sale, :boolean, null: false, default: true
  end
end
