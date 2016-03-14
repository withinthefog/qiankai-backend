class CreateJoinTableTagProduct < ActiveRecord::Migration
  def change
    create_join_table :tags, :products do |t|
    end
  end
end
