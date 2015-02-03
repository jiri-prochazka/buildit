json.array!(@addresses) do |address|
  json.extract! address, :id, :street, :city, :zip, :country, :user_id
  json.url address_url(address, format: :json)
end
