class Api::V1::CitiesController < ApiController
  def index
    raise ActiveRecord::RecordNotFound, "Please provide province id to fetch cities" unless params[:province_id]
    @cities = Province.find(params[:province_id]).cities
  end
end
