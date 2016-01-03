class CreateCreateSpaces < ActiveRecord::Migration
  def change
    create_table :create_spaces do |t|
      t.text :introduction
      t.text :policy
      t.text :support
      t.timestamps
    end
  end
end
