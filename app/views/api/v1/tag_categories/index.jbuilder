json.tag_categories @tag_categories do |tag_category|
  json.display tag_category.display
  json.name tag_category.name
  json.tags tag_category.tags do |tag|
    json.display tag.display
    json.name tag.name
  end
end