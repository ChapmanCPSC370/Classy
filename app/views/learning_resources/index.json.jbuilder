json.array!(@learning_resources) do |learning_resource|
  json.extract! learning_resource, :id, :name, :resourceurl, :description, :section_id
  json.url learning_resource_url(learning_resource, format: :json)
end
