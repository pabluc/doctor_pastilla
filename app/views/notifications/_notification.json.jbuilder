json.extract! notification, :id, :medicine, :email, :cadence, :created_at, :updated_at
json.url notification_url(notification, format: :json)
