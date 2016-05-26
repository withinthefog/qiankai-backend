class Api::V1::ShipmentFeesController < ApiController
  before_action :authenticate_consumer_from_token!, only: [:pre_calculate]
  before_action :authenticate_consumer!, only: [:pre_calculate]

  def index
    @free_shipment = FreeShipmentCoupon.last
    @shipment_fees = ShipmentFee.all
  end

  def pre_calculate
    @address_id = params[:address_id]
    address = Address.find(params[:address_id])
    raise ActiveRecord::RecordNotFound, 'Address has been deleted' if address.deleted
    raise UnauthorizedException unless address.try(:consumer_id) == current_consumer.id

    @shipment_fee = ShipmentFeeService.calculate_by_address(params[:address_id])
    render :show
  end

end
