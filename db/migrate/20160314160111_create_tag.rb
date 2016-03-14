class CreateTag < ActiveRecord::Migration
  def change
    create_table :tags, options: 'ROW_FORMAT=DYNAMIC' do |t|
      t.string :display
      t.string :name
      t.timestamps
    end
  end
end
