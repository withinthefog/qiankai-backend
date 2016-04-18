# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  consumer_id :integer
#  address_id  :integer
#  state       :string(255)
#  total_price :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  ship_fee    :integer
#  sn          :string(255)
#

class Order < ActiveRecord::Base
  has_many :line_items
  has_many :products, through: :line_items
  belongs_to :consumer
  belongs_to :address
end
