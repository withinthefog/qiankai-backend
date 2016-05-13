class ShipmentFeeService
  def self.calculate(address_id)
    address = Address.find(address_id)
    shipment_fee = ShipmentFee.find_by_city_id(address.city_id) || ShipmentFee.find_by_province_id(address.province_id)
    shipment_fee.try(:price) || 0
  end
end