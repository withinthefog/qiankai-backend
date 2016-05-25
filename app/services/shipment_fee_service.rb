class ShipmentFeeService
  def self.calculate(order)
    return 0 if order.products.map(&:free_ship).inject(true){|result, item| result && item}
    address = order.address
    shipment_fee = ShipmentFee.find_by_city_id(address.city_id) || ShipmentFee.where(province_id: address.province_id, city_id: nil)[0]
    shipment_fee.try(:price) || 0
  end
end