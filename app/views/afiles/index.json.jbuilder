json.array!(@afiles) do |afile|
  json.extract! afile, :id
  json.url afile_url(afile, format: :json)
end
