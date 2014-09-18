json.array!(@courses) do |course|
  json.extract! course, :id, :university_id, :name, :description, :credits
  json.url course_url(course, format: :json)
end
