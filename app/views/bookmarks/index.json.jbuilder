json.array!(@bookmarks) do |bookmark|
  json.extract! bookmark, :id, :name, :description, :url
  json.url bookmark_url(bookmark, format: :json)
end
