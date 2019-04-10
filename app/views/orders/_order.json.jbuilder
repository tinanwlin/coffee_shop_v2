json.extract! order, :id, :order_number, :order_date, :total_price, :created_at, :updated_at
json.url order_url(order, format: :json)
