json.advertisements @advertisements do |advertisement|
  json.id advertisement.id
  json.imageUrl advertisement.attachments[0].url
  json.link advertisement.link
end