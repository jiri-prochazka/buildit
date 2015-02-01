json.array!(@projects) do |project|
  json.extract! project, :id, :name, :estimated_finish, :completed_at, :archived
  json.url project_url(project, format: :json)
end
