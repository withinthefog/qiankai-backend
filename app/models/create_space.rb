# == Schema Information
#
# Table name: create_spaces
#
#  id           :integer          not null, primary key
#  introduction :text
#  policy       :text
#  support      :text
#  created_at   :datetime
#  updated_at   :datetime
#

class CreateSpace < ActiveRecord::Base
end
