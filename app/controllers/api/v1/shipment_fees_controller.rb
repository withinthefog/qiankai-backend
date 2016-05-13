class Api::V1::ShipmentFeesController < ApiController

  def index
    @free_shipment = FreeShipmentCoupon.last
    @shipment_fees = ShipmentFee.all
  end

end
