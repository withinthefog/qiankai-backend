class Api::V1::WechatsController < ApplicationController
  def sign_in
    @consumer = Consumer.create(email: params['code']+'@wechat.com', password: 'zhiyecaoshou')

    render :json => {
               :consumer => @consumer,
               :status => :ok
           }
  end
end
