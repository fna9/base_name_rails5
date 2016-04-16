json.array!(@page_pages) do |page_page|
  json.extract! page_page, :id, :page_id, :page_id
  json.url page_page_url(page_page, format: :json)
end
