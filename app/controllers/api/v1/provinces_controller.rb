class Api::V1::ProvincesController < ApiController
  def index
    @provinces = Province.all
  end

  def create
    create_in_batch_params.each do |province|
      cities = City.create(province.delete(:cities))
      Province.create(province.merge(cities: cities))
    end
    @provinces = Province.all
    render :index
  end

  private
  def create_in_batch_params
    params.require(:provinces).map do |province|
      province.permit(:name, :pro_remark, :display_weight, {cities: [:name]})
    end
  end
end
