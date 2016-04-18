class Api::V1::ArticlesController < ApiController

  def index
    if params['category'] && category = Category.find_by_display(params['category'])
      @articles = Article.where(category: category)
    elsif !Category.find_by_display(params['category'])
      @articles = []
    else
      @articles = Article.all
    end
    @articles = @articles.to_a.reverse
  end

  def show
    if params[:id] == 'about'
      category = Category.find_by_display('about')
      @article = Article.find_by_category_id(category.try(:id))
    else
      @article = Article.find(params[:id])
    end
  end

  def search
    @result = Article.where("title like ?", "%#{params[:key_word]}%").to_a
    @result += Activity.where("title like ?", "%#{params[:key_word]}%").to_a
    @result += Job.where("title like ?", "%#{params[:key_word]}%").to_a
    @result += News.where("title like ?", "%#{params[:key_word]}%").to_a
  end

end
