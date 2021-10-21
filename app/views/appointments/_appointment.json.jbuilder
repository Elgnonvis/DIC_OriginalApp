json.extract! appointment, :id, :description, :status, :date, :user_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
