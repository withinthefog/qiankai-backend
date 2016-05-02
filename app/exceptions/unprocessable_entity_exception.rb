class UnprocessableEntityException < BaseQiankaiException
  attr_reader :code

  def initialize(msg=nil, code=nil)
    @message = msg
    @code = code || 422
  end

  def message
    @message || 'You request is not processable'
  end
end