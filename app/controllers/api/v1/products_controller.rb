class Api::V1::ProductsController < ApiController

  def index
    @products = Tag.find_by_display(params['tag']).products
  end

end
