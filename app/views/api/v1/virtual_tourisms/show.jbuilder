json.virtual_tourism do
  json.id @virtual_tourism.id
  json.title @virtual_tourism.title
  json.description @virtual_tourism.description
  json.video @virtual_tourism.video.try(:url)
  json.video_thumb @virtual_tourism.video_thumb
end