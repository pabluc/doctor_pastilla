json.extract! notification, :id, :medicine, :email, :cadence_minutes, :start, :created_at, :updated_at
json.url notification_url(notification, format: :json)
