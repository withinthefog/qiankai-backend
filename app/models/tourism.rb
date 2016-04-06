# == Schema Information
#
# Table name: tourisms
#
#  id                          :integer          not null, primary key
#  title                       :string(255)      景点名称
#  description                 :string(255)      景点描述
#  content                     :text             景点正文
#  created_at                  :datetime
#  updated_at                  :datetime
#

class Tourism < ActiveRecord::Base
  has_and_belongs_to_many :tourism_tags
  has_many :attachments, as: :attachable
  accepts_nested_attributes_for :attachments, allow_destroy: true
end
