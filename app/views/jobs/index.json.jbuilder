json.array!(@jobs) do |job|
  json.extract! job, :id, :name, :description, :confirmed_at, :progress, :estimated_time, :estimated_price, :real_price, :completed_at, :project_id
  json.url job_url(job, format: :json)
end
