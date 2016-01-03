class CreateAttachment < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string   "attachable_type",    limit: 255
      t.integer  "attachable_id",      limit: 4
      t.string   "image_file_name",    limit: 255
      t.string   "image_content_type", limit: 255
      t.integer  "image_file_size",    limit: 4
      t.datetime "image_updated_at"

      t.timestamps
    end
  end
end
