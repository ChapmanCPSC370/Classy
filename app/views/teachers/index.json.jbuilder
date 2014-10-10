json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :name, :department_id, :degree, :alma_mater, :university_id
  json.url teacher_url(teacher, format: :json)
end
