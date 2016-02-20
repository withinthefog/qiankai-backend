class Api::V1::AdvertisementsController < ApiController

  def index
    @advertisement = Advertisement.last
  end

end
