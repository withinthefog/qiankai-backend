class Api::V1::WechatsController < ApplicationController
  def sign_in
    @consumer = Consumer.find_or_create_by(email: params['code']+'@wechat.com') do |consumer|
      consumer.password = 'zhiyecaoshou'
    end

    render :json => {
               :consumer => @consumer,
               :status => :ok
           }
  end
end
