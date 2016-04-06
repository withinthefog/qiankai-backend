json.tourism_advertisements @tourism_advertisements do |tourism_advertisement|
  json.id tourism_advertisement.id
  json.imageUrl tourism_advertisement.attachments[0].url
  json.link tourism_advertisement.link
end