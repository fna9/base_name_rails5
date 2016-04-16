json.array!(@messager_users) do |messager_user|
  json.extract! messager_user, :id, :messager_id, :user_id
  json.url messager_user_url(messager_user, format: :json)
end
