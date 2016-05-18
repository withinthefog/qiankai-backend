class ShipmentFeeService
  def self.calculate(address_id)
    address = Address.find(address_id)
    shipment_fee = ShipmentFee.find_by_city_id(address.city_id) || ShipmentFee.where(province_id: address.province_id, city_id: nil)[0]
    shipment_fee.try(:price) || 0
  end
end