class TourismAdvertisements < ActiveRecord::Migration
  def change
  	create_table :tourism_advertisements, options: 'ROW_FORMAT=DYNAMIC' do |t|
      t.string :title
      t.string :link
      t.timestamps
    end
  end
end
