json.array!(@attachments) do |attachment|
  json.extract! attachment, :id, :name, :job_id
  json.url attachment_url(attachment, format: :json)
end
