class Api::V1::TourismsController < ApiController

  def index
    @tourisms = Tourism_Tag.find_by_display(params['tourism_tag']) ? Tourism_Tag.find_by_display(params['tourism_tag']).tourisms : []
  end

  def show
    @tourism = Tourism.find(params['id'].to_i)
  end

end
