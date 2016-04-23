class WeChatService
  include HTTParty

  @app_id = ENV['WE_CHAT_APP_ID'] || 'wxabc772dc59caa03c'
  @app_secret = ENV['WE_CHAT_APP_SECRET'] || '5d4a5e1f33d92c04c4932baf70339863'
  @sns_scope = 'snsapi_userinfo'
  @state = 'WECHAT'

  def self.we_chat_oauth
    self.get(code_url)
  end

  def self.get_access_token(code)
    self.get(access_token_url_for(code))
  end

  def self.refresh_token_for(user)
    result_string = (self.get(refresh_token_url(user.refresh_token))).parsed_response
    result_json = JSON.parse(result_string)
    user.update!(refresh_token: result_json['refresh_token'])
    result_json['access_token']
  end

  def self.get_user_info(access_token, open_id)
    self.get(user_info_url(access_token, open_id))
  end

  def self.send_message(message, open_id, access_token)
    result = self.post(send_message_url(access_token), body: {
                                  touser: open_id,
                                  msgtype: 'text',
                                  text: { content: message }
                              } )
  end

  private
  def self.access_token_url_for(code)
    "https://api.weixin.qq.com/sns/oauth2/access_token?appid=#{@app_id}&secret=#{@app_secret}&code=#{code}&grant_type=authorization_code"
  end

  def self.refresh_token_url(refresh_token)
    "https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=#{@app_id}&grant_type=refresh_token&refresh_token=#{refresh_token}"
  end

  def self.user_info_url(access_token, open_id)
    "https://api.weixin.qq.com/sns/userinfo?access_token=#{access_token}&openid=#{open_id}&lang=zh_CN"
  end

  def self.send_message_url(access_token)
    "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=#{access_token}"
  end

end