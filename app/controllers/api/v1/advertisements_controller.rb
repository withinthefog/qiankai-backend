class Api::V1::AdvertisementsController < ApiController

  def index
    @advertisements = Advertisement.all
  end

end
