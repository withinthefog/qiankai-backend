class Api::V1::ProductsController < ApiController

  def index
    @products = Tag.find_by_display(params['tag']).products
  end

  def show
    @product = Product.find(params['id'].to_i)
  end

end
