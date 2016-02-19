# == Schema Information
#
# Table name: create_spaces
#
#  id           :integer          not null, primary key
#  introduction :text(65535)
#  policy       :text(65535)
#  support      :text(65535)
#  created_at   :datetime
#  updated_at   :datetime
#

class CreateSpace < ActiveRecord::Base
end
