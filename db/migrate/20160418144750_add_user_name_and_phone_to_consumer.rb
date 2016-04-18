class AddUserNameAndPhoneToConsumer < ActiveRecord::Migration
  def change
    add_column :consumers, :user_name, :string
    add_column :consumers, :phone, :string
  end
end
