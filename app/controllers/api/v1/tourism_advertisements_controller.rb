class Api::V1::TourismAdvertisementsController < ApiController

  def index
    @tourism_advertisements = TourismAdvertisement.all
  end

end
