json.array!(@subject_teachers) do |subject_teacher|
  json.extract! subject_teacher, :id, :subject_id, :teacher_id
  json.url subject_teacher_url(subject_teacher, format: :json)
end
