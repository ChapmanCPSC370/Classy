json.array!(@universities) do |university|
  json.extract! university, :id, :name, :description
  json.url university_url(university, format: :json)
end
