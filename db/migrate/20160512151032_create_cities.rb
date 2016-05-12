class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :province_id
      t.integer :display_weight
      t.timestamps
    end
  end
end
