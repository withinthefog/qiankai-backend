json._links do
  json.self do
    json.href '/api/v1/jobs'
  end
end

json.jobs @jobs