json.array!(@reviews) do |review|
  json.extract! review, :id, :section_id, :rating, :description, :name, :user_id
  json.url review_url(review, format: :json)
end
