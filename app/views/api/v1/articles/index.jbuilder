json._links do
  json.self do
    json.href '/api/v1/articles'
  end
end
json.articles @articles