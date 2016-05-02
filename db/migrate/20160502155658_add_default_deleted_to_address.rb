class AddDefaultDeletedToAddress < ActiveRecord::Migration
  def change
    remove_column :addresses, :province_id
    remove_column :addresses, :city_id

    add_column :addresses, :is_default, :boolean, null: false, default: false
    add_column :addresses, :deleted, :boolean, null: false, default: false
  end
end
