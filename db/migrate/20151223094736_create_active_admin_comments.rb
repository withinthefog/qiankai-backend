class CreateActiveAdminComments < ActiveRecord::Migration
  def self.up
    create_table :active_admin_comments, options: 'ROW_FORMAT=DYNAMIC' do |t|
      t.string :namespace
      t.text   :body
      t.string :resource_id,   null: false
      t.string :resource_type, null: false
      t.references :author, polymorphic: true
      t.timestamps
    end
  end

  def self.down
    drop_table :active_admin_comments
  end
end
