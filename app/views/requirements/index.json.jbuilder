json.array!(@requirements) do |requirement|
  json.extract! requirement, :id, :content, :project_id
  json.url requirement_url(requirement, format: :json)
end
