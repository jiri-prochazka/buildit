json.array!(@concepts) do |concept|
  json.extract! concept, :id, :name, :price, :start_at, :end_at, :description
  json.url concept_url(concept, format: :json)
end
