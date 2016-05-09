# == Schema Information
#
# Table name: addresses
#
#  id            :integer          not null, primary key
#  receiver      :string(255)
#  phone         :string(255)
#  address       :string(255)
#  city_name     :string(255)
#  province_name :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  consumer_id   :integer
#  is_default    :boolean          default(FALSE), not null
#  deleted       :boolean          default(FALSE), not null
#

class Address < ActiveRecord::Base
  belongs_to :consumer
  has_many :orders
end
