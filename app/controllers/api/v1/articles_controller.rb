class Api::V1::ArticlesController < ApiController

  def index
    category = Category.find_by_name(params['category'])
    @articles = category ? Article.where(category: category) : Article.all
    @articles = @articles.to_a.reverse
  end

end
