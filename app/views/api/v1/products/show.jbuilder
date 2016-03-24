json.product do
  json.id @product.id
  json.colorId 2
  json.name @product.name
  json.images @product.attachments.map(&:url)
  json.description @product.description
  json.price @product.price
  json.soldAmount 121
  json.comments ["好产品", "经久耐用"]
  json.service_description "由\"开县春秋农业开发有限公司\"直接销售和发货，并提供售后服务"
  json.score 4.74
  json.attitude 4.78
  json.logistics 4.75
  json.customer do
    json.name "开县春秋农业开发有限公司"
    json.telephone "023-12343223"
  end
  json.product_detail @product.product_detail.url
  json.service @product.service.url
end