json.array!(@assignments) do |assignment|
  json.extract! assignment, :id, :section_id, :name, :description, :duedate, :points
  json.url assignment_url(assignment, format: :json)
end
