# == Schema Information
#
# Table name: provinces
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  pro_remark     :string(255)
#  display_weight :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Province < ActiveRecord::Base
  has_many :cities
end
