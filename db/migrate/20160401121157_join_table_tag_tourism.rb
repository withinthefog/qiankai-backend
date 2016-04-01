class JoinTableTagTourism < ActiveRecord::Migration
  def change
  	create_join_table :tourism_tags, :tourisms do |t|
  	end
  end
end
