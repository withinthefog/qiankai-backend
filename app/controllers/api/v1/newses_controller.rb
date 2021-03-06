class Api::V1::NewsesController < ApiController

  def index
    @newses = params['latest'] ? News.last(6) : News.all
    @newses = @newses.to_a.reverse
  end

  def show
    @news = News.find(params[:id])
  end

end
