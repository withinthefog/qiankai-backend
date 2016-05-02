json.consumer do
  json.email @consumer.email unless @consumer.openid
  json.user_name @consumer.user_name || @consumer.nickname
  json.phone @consumer.phone
  json.token @consumer.authentication_token
end
