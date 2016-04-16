json.array!(@afile_messagers) do |afile_messager|
  json.extract! afile_messager, :id, :afile_id, :messager_id
  json.url afile_messager_url(afile_messager, format: :json)
end
