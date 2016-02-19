# == Schema Information
#
# Table name: activities
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Activity < ActiveRecord::Base
  has_many :attachments, as: :attachable
  accepts_nested_attributes_for :attachments, allow_destroy: true
end
