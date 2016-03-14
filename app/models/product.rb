# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  image_url   :string(255)
#  description :string(255)
#  price       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  link        :string(255)
#  hot         :boolean
#

class Product < ActiveRecord::Base
  scope :hot, -> () {
    where(hot: true)
  }

  has_and_belongs_to_many :tags
end
