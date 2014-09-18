json.array!(@sections) do |section|
  json.extract! section, :id, :course_id, :term, :teacher, :schedule, :room
  json.url section_url(section, format: :json)
end
