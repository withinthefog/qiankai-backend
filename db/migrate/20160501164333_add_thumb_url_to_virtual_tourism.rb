class AddThumbUrlToVirtualTourism < ActiveRecord::Migration
  def change
    add_column :virtual_tourisms, :video_url, :string
    add_attachment :virtual_tourisms, :thumb_nail
  end
end
