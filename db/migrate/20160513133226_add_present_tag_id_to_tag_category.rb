class AddPresentTagIdToTagCategory < ActiveRecord::Migration
  def change
    add_column :tag_categories, :present_tag_id, :integer
  end
end
