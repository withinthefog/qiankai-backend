class Api::V1::ArticlesController < ApiController

  def index
    @articles = Article.all
  end

end
