json.array!(@community_pages) do |community_page|
  json.extract! community_page, :id, :page_id, :community_id, :ismain
  json.url community_page_url(community_page, format: :json)
end
