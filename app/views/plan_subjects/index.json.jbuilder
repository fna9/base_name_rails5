json.array!(@plan_subjects) do |plan_subject|
  json.extract! plan_subject, :id, :plan_id, :subject_id
  json.url plan_subject_url(plan_subject, format: :json)
end
