class Api::V1::JobsController < ApiController

  def index
    @jobs = params['latest'] ? Job.last(6) : Job.all
    @jobs = @jobs.to_a.reverse
  end

end
