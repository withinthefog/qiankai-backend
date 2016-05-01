class Api::V1::VirtualTourismsController < ApiController
  def index
    @virtual_tourisms = VirtualTourism.all
  end

  def show
    @virtual_tourism = VirtualTourism.find(params['id'].to_i)
  end
end
