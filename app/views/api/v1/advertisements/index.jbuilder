json._links do
  json.self do
    json.href '/api/v1/advertisements'
  end
end

json.advertisement do
  json.title = @advertisement.title
  json.link = @advertisement.link
  json.image = @advertisement.attachments.first.image.url
end