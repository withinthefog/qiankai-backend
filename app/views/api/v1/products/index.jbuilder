json._links do
  json.self do
    json.href '/api/v1/products'
  end
end

json.products @products do |product|
  json.id product.id
  json.name product.name
  json.image product.attachments.size > 0 ? product.attachments[0].url : ''
  json.description product.description
  json.price product.price
end