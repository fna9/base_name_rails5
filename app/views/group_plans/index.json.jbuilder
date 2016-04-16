json.array!(@group_plans) do |group_plan|
  json.extract! group_plan, :id
  json.url group_plan_url(group_plan, format: :json)
end
