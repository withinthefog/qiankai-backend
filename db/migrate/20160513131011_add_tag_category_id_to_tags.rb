class AddTagCategoryIdToTags < ActiveRecord::Migration
  def change
    add_column :tags, :tag_category_id, :integer
  end
end
