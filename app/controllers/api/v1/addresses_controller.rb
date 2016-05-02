class Api::V1::AddressesController < ApiController
  before_action :authenticate_consumer_from_token!
  before_action :authenticate_consumer!

  def index
    @addresses = current_consumer.addresses.where(deleted: false)
  end

  def create
    current_consumer.addresses.each {|address| address.update(is_default: false)} if(address_params['isDefault'])

    @address = Address.create(receiver: address_params['receiver'], phone: address_params['phone'],
                              address: address_params['address'], city_name: address_params['cityName'],
                              province_name: address_params['provinceName'], consumer_id: current_consumer.id,
                              is_default: address_params['isDefault'])

    render :show
  end

  def destroy
    @address_id = params[:id]
    address = Address.find(params[:id])
    raise UnauthorizedException unless address.try(:consumer_id) == current_consumer.id
    address.update(deleted: true)
  end

  private
  def address_params
    params.require(:address).permit(:receiver, :phone, :address, :isDefault, :cityName, :provinceName)
  end
end
