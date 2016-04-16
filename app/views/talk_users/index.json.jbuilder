json.array!(@talk_users) do |talk_user|
  json.extract! talk_user, :id, :user_id, :talk_id
  json.url talk_user_url(talk_user, format: :json)
end
