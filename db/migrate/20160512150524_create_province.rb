class CreateProvince < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.string :name
      t.string :pro_remark
      t.integer :display_weight
      t.timestamps
    end
  end
end
