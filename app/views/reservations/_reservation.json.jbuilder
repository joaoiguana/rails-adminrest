json.extract! reservation, :id, :restaurant_id, :customer_id, :name, :group_size, :reservation_date, :status, :comments, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
