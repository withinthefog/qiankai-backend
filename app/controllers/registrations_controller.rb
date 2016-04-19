class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    @consumer = Consumer.new(consumer_params)
    if(@consumer.save)
      render :json => {
                 :consumer => @consumer,
                 :status => :ok
             }
    else
      render :json => {:state => :failed, :messages => @consumer.errors.messages.map{|key, value| value[0]}.join('\n')}
    end
  end

  private

  def consumer_params
    params.require(:consumer).permit(:user_name, :phone, :email, :password, :password_confirmation)
  end
end