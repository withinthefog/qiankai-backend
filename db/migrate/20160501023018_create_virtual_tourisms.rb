class CreateVirtualTourisms < ActiveRecord::Migration
  def change
    create_table :virtual_tourisms do |t|
      t.string :title
      t.string :description
      t.timestamps null: false
    end
  end
end
