json.extract! message, :id, :to, :from, :content, :created_at, :updated_at
json.url message_url(message, format: :json)
