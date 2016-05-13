# == Schema Information
#
# Table name: shipment_fees
#
#  id               :integer          not null, primary key
#  province_id      :integer
#  city_id          :integer
#  destination_name :string(255)
#  price            :float(24)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class ShipmentFee < ActiveRecord::Base
  belongs_to :province
  belongs_to :city

  before_save :set_destination_name
  def set_destination_name
    self.destination_name = self.province.name + (self.city ? "/#{self.city.name}" : '')
  end
end
