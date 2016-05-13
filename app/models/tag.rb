# == Schema Information
#
# Table name: tags
#
#  id              :integer          not null, primary key
#  display         :string(255)
#  name            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  tag_category_id :integer
#

class Tag < ActiveRecord::Base
  has_and_belongs_to_many :products
  belongs_to :tag_category
end
