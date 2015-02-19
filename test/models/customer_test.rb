require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "create customer" do
    assert_difference "Customer.count" do
    	c = Customer.create(email: "customer@test.com", name: "John", surname: "Customer", phone: "+420777123123", salutation: "Mr.", nationality: "CZ", newsletter: false)
    	assert_equal "Customer", c.type
    	assert_equal "customer", c.role
    end
  end

  test "check validations" do

  	assert_difference "Customer.count" do
	  	a = Customer.new
	  	assert !a.valid?
	  	assert a.errors.messages.include?(:name)
	  	assert a.errors.messages.include?(:surname)
	  	assert a.errors.messages.include?(:email)
	  	a.name = "Jim"
	  	a.surname = "Beam"
	  	a.email = users(:customer1).email
	  	assert !a.valid?
	  	a.email = "bleh@blah.com"
	  	assert a.valid?
	  	assert a.save
	  end
  end

  
end
