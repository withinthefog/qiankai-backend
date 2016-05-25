class AddInvoiceTitleToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :invoice_title, :string
  end
end
