json.transaction do
  json.id @transaction.id
  json.order_id @transaction.order_id
  json.status @transaction.status
  json.transaction_type @transaction.transaction_type
  json.amount @transaction.amount
  json.card_holder_name @transaction.card_holder_name
end