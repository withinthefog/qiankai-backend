json.customer @customer_name

json.products @products do |product|
  json.id product.id
  json.name product.name
  json.image product.product_images.size > 0 ? product.product_images[0].url : ''
  json.description product.description
  json.price product.price
end