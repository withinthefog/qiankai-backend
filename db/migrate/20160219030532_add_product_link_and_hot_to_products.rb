class AddProductLinkAndHotToProducts < ActiveRecord::Migration
  def change
    add_column :products, :link, :string
    add_column :products, :hot, :boolean
  end
end
