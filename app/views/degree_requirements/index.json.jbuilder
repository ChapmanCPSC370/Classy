json.array!(@degree_requirements) do |degree_requirement|
  json.extract! degree_requirement, :id, :course_id, :major_id, :minor_id
  json.url degree_requirement_url(degree_requirement, format: :json)
end
