json.array!(@sections) do |section|
  json.extract! section, :id, :course_id, :term, :teacher, :schedule, :room
  json.title section.teacher
  json.start section.start_time
  json.end section.end_time
  json.url section_url(section, format: :json)
end
