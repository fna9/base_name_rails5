json.array!(@page_subjects) do |page_subject|
  json.extract! page_subject, :id, :page_id, :subject_id
  json.url page_subject_url(page_subject, format: :json)
end
