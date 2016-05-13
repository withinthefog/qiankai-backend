class Api::V1::ShipmentFeesController < ApiController

  def index
    @shipment_fees = ShipmentFee.all
  end

end
