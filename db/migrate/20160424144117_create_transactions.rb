class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :order_id
      t.string :pingpp_id
      t.string :status
      t.string :transaction_type
      t.float :amount
      t.timestamps null: false
    end
  end
end
