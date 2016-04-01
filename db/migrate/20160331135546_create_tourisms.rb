class CreateTourisms < ActiveRecord::Migration
  def change
    create_table :tourisms, options: 'ROW_FORMAT=DYNAMIC' do |t|
      t.string :title
      t.text :description
      t.text :content
      t.timestamps
    end
  end
end
