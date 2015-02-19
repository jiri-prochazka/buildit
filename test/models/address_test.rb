require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  test "create address" do
    assert_difference "Address.count" do
    	Address.create(street: "Street 1", city: "Prague", zip: 19000, country: "CZ")
    end
  end

  test "check validations" do
  	assert_difference "Address.count" do
	  	a = Address.new
	  	assert !a.valid?
	  	assert a.errors.messages.include?(:city)
	  	assert a.errors.messages.include?(:zip)
	  	assert a.errors.messages.include?(:country)
	  	a.city = "Prague"
	  	a.zip = "19000"
	  	a.country = "CZ"
	  	assert a.valid?
	  	assert a.save
	  end
  end
end