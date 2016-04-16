json.array!(@messages) do |message|
  json.extract! message, :id, :header, :text, :talk_id, :user_id
  json.url message_url(message, format: :json)
end
