class AddVideoToVirtualTourisms < ActiveRecord::Migration
  def change
    add_attachment :virtual_tourisms, :video
  end
end
