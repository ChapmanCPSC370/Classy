json.array!(@departments) do |department|
  json.extract! department, :id, :department_tag, :name, :description, :university_id
  json.url department_url(department, format: :json)
end
