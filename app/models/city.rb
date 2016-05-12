# == Schema Information
#
# Table name: cities
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  province_id    :integer
#  display_weight :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class City < ActiveRecord::Base
  belongs_to :privince
end
