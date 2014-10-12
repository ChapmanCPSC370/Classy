json.array!(@completed_courses) do |completed_course|
  json.extract! completed_course, :id, :course_id, :section_id, :term, :user_id, :grade
  json.url completed_course_url(completed_course, format: :json)
end
