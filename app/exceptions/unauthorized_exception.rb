class UnauthorizedException  < BaseQiankaiException
  def message
    'You are not permitted to this request'
  end
end
