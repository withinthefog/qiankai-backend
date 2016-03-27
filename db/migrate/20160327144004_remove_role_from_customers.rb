class RemoveRoleFromCustomers < ActiveRecord::Migration
  def change
    remove_column :customers, :role
  end
end
