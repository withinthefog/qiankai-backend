class AddPaymentMethodIdAndPaymentMethodToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :payment_method_id, :integer
    add_column :orders, :payment_method_name, :string
  end
end
