class CreateAdvertisement < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :title
      t.string :link
      t.timestamps
    end
  end
end
