# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  text       :text(65535)
#  created_at :datetime
#  updated_at :datetime
#

class Activity < ActiveRecord::Base
  has_many :attachments, as: :attachable
  accepts_nested_attributes_for :attachments, allow_destroy: true
end
