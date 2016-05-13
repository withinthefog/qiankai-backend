# == Schema Information
#
# Table name: tag_categories
#
#  id             :integer          not null, primary key
#  display        :string(255)
#  name           :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  present_tag_id :integer
#

class TagCategory < ActiveRecord::Base
  has_many :tags
  belongs_to :present_tag, class_name: 'Tag', foreign_key: 'present_tag_id'
end
