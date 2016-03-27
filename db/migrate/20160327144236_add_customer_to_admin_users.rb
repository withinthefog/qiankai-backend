class AddCustomerToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :customer_id, :integer
  end
end
