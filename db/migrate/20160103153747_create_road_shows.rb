class CreateRoadShows < ActiveRecord::Migration
  def change
    create_table :road_shows do |t|
      t.string :name
      t.text :description
      t.string :video_link
      t.timestamps
    end
  end
end
