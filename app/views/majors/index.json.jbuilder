json.array!(@majors) do |major|
  json.extract! major, :id, :university_id, :name, :description, :department_id
  json.url major_url(major, format: :json)
end
