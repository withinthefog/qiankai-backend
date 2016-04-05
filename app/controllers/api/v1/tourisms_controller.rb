class Api::V1::TourismsController < ApiController

  def index
    @tourisms = TourismTag.find_by_display(params['tourism_tag']) ? TourismTag.find_by_display(params['tourism_tag']).tourisms : []
  end

  def show
    @tourism = Tourism.find(params['id'].to_i)
  end

end
