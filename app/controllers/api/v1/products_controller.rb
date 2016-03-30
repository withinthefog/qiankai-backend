class Api::V1::ProductsController < ApiController

  def index
    @products = Tag.find_by_display(params['tag']) ? Tag.find_by_display(params['tag']).products : []
  end

  def show
    @product = Product.find(params['id'].to_i)
  end

  def search
    @products = Product.where("name like ?", "%#{params[:key_word]}%")
    render :index
  end

end
