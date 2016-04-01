# == Schema Information
#
# Table name: tourism_tags
#
#  id         :integer          not null, primary key
#  display    :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#


class TourismTag < ActiveRecord::Base
	has_and_belongs_to_many :tourisms
end
