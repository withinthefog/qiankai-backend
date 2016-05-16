json.free_shipment_amount @free_shipment.try(:min_price)
json.shipment_fees @shipment_fees do |shipment_fee|
  json.destination_name shipment_fee.destination_name
  json.price shipment_fee.price
end