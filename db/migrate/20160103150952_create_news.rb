class CreateNews < ActiveRecord::Migration
  def change
    create_table :news, options: 'ROW_FORMAT=DYNAMIC' do |t|
      t.string :title
      t.text :text
      t.timestamps
    end
  end
end
