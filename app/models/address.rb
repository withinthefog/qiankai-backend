# == Schema Information
#
# Table name: addresses
#
#  id            :integer          not null, primary key
#  receiver      :string(255)
#  phone         :string(255)
#  city_id       :integer
#  province_id   :integer
#  address       :string(255)
#  city_name     :string(255)
#  province_name :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  consumer_id   :integer
#

class Address < ActiveRecord::Base
  belongs_to :consumer
  has_many :orders
end
