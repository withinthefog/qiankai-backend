class Api::V1::ArticlesController < ApiController

  def index
    if params['category'] && category = Category.find_by_name(params['category'])
      @articles = Article.where(category: category)
    elsif !Category.find_by_name(params['category'])
      @articles = []
    else
      @articles = Article.all
    end
    @articles = @articles.to_a.reverse
  end

  def show
    if params[:id] == 'about'
      category = Category.find_by_name('关于')
      @article = Article.find_by_category_id(category.try(:id))
    else
      @article = Article.find(params[:id])
    end
  end

end
