# == Schema Information
#
# Table name: tag_categories
#
#  id         :integer          not null, primary key
#  display    :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TagCategory < ActiveRecord::Base
  has_many :tags
end
