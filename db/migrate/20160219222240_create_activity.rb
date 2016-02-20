class CreateActivity < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.text :text
      t.timestamps
    end
  end
end
