class Api::V1::AddressesController < ApiController
  before_action :authenticate_consumer_from_token!
  before_action :authenticate_consumer!

  def index
    @addresses = current_consumer.addresses
  end

  def create
    @address = Address.create(receiver: address_params['receiver'], phone: address_params['phone'], address: address_params['address'], city_name: address_params['cityId'], province_id: address_params['provinceId'], consumer_id: current_consumer.id)

    render :show
  end

  private
  def address_params
    params.permit(:receiver, :phone, :address, :cityId, :provinceId, :isDefault, :city_name, :province_name)
  end
end
