class AddFieldsForOAuthToConsumer < ActiveRecord::Migration
  def change
    add_column :consumers, :provider, :string
    add_column :consumers, :openid, :string
    add_column :consumers, :nickname, :string
    add_column :consumers, :sex, :integer
    add_column :consumers, :city, :string
    add_column :consumers, :province, :string
    add_column :consumers, :headimgurl, :string
    add_column :consumers, :refresh_token, :string
  end
end
