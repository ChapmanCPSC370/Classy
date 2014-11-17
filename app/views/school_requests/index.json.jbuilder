json.array!(@school_requests) do |school_request|
  json.extract! school_request, :id, :user_id, :school_name, :number_requests
  json.url school_request_url(school_request, format: :json)
end
