# == Schema Information
#
# Table name: road_shows
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  vedio_link  :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class RoadShow < ActiveRecord::Base
end
