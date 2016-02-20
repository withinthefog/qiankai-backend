class CreateActivity < ActiveRecord::Migration
  def change
    create_table :activities, options: 'ROW_FORMAT=DYNAMIC' do |t|
      t.string :title
      t.text :text
      t.timestamps
    end
  end
end
