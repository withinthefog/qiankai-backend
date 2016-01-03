# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  text        :text
#  created_at  :datetime
#  updated_at  :datetime
#  category_id :integer
#

class Article < ActiveRecord::Base
  belongs_to :category
  has_many :attachments, as: :attachable
  accepts_nested_attributes_for :attachments, allow_destroy: true
end
