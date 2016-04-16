json.array!(@group_students) do |group_student|
  json.extract! group_student, :id, :group_id, :student_id
  json.url group_student_url(group_student, format: :json)
end
