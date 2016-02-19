class Api::V1::ProductsController < ApiController

  def index
    @products = params['hot'] ? Product.hot : Product.all
  end

end
