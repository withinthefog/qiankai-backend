class RegistrationsController < Devise::RegistrationsController

  def create
    @consumer = Consumer.new(consumer_params)
    begin
      @consumer.save
      render :json => {
                 :consumer => @consumer,
                 :status => :ok
             }
    rescue
      render :json => {:state => :failed, :messages => 'Sign up failed'}
    end
  end

  private

  def consumer_params
    params.require(:consumer).permit(:email, :password, :password_confirmation)
  end
end