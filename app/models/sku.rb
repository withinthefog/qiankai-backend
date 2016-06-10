# == Schema Information
#
# Table name: skus
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  price      :float(24)
#  product_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Sku < ActiveRecord::Base
  belongs_to :product
end
