class Api::V1::ActivitiesController < ApiController

  def index
    @activities = params['latest'] ? Activity.last(6) : Activity.all
    @activities = @activities.to_a.reverse
  end

end
