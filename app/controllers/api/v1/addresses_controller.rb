class Api::V1::AddressesController < ApiController
  before_action :authenticate_consumer_from_token!
  before_action :authenticate_consumer!

  def index
    @addresses = current_consumer.addresses
  end

  def create
    @address = Address.create(receiver: address_params['receiver'], phone: address_params['phone'],
                              address: address_params['address'], city_name: address_params['cityName'],
                              province_name: address_params['provinceName'], consumer_id: current_consumer.id)

    render :show
  end

  private
  def address_params
    params.require(:address).permit(:receiver, :phone, :address, :isDefault, :cityName, :provinceName)
  end
end
