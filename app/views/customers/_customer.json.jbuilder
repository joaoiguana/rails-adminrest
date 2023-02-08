json.extract! customer, :id, :phone, :created_at, :updated_at
json.url customer_url(customer, format: :json)
