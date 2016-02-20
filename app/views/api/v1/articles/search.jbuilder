json.result @result do |result|
  json.category result.class.name.downcase.pluralize
  json.id result.id
  json.title result.title
  json.created_at result.created_at
  json.updated_at result.updated_at
end