class AddConsumerIdToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :consumer_id, :integer
  end
end
