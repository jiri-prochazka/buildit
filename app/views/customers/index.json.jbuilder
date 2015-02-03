json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :surname, :phone, :email, :salutation, :nationality, :newsletter
  json.url customer_url(customer, format: :json)
end
