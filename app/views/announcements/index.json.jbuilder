json.array!(@announcements) do |announcement|
  json.extract! announcement, :id, :section_id, :info
  json.url announcement_url(announcement, format: :json)
end
