class Api::V1::WechatsController < ApiController
  def sign_in
    code = params[:code]

    access_token_string = WeChatService.get_access_token(code).parsed_response
    access_token_json = JSON.parse(access_token_string)

    user_info_string = WeChatService.get_user_info(access_token_json['access_token'], access_token_json['openid']).parsed_response
    user_info_json = JSON.parse(user_info_string).except('privilege', 'language', 'country')

    @consumer = create_and_sign_consumer(user_info_json.merge(email: "#{code}@wechat.com", password: "#{code}", refresh_token: access_token_json['refresh_token']))

    render :json => {
               :consumer => @consumer,
               :status => :ok
           }
  end

  private
  def create_and_sign_consumer(consumer_info_json)
    consumer = Consumer.find_or_create_by(openid: consumer_info_json['openid'])
    consumer.update!(consumer_info_json)
    consumer
  end
end
