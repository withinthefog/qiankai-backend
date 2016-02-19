class Api::V1::NewsesController < ApiController

  def index
    @newses = params['latest'] ? News.last(6) : News.all
    @newses.reverse!
  end

end
