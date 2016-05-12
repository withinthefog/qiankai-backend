class Api::V1::ProvincesController < ApiController
  def index
    @provinces = Province.all
  end
end
