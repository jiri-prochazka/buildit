require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "create customer" do
    assert_difference "User.count" do
    	c = User.create(email: "User@test.com", name: "John", surname: "User", password: "password123", phone: "+420777123123", salutation: "Mr.", nationality: "CZ", newsletter: false)
    	assert_equal "Customer", c.type
    	assert_equal "customer", c.role
    	assert_not_nil c.encrypted_password
    end
  end

  test "check validations" do
  	assert_difference "Customer.count" do
  		assert_difference "User.count" do
		  	a = User.new
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

  test "roles inheritance" do
  	u = users(:admin)
  	assert u.role? :customer
  	assert u.role? :manager
  	assert u.role? :admin

  	u2 = users(:employee1)
  	assert u2.role? :customer
  	assert u2.role? :manager
  	assert !(u2.role? :admin)

  	u3 = users(:customer1)
  	assert u3.role? :customer
  	assert !(u3.role? :manager)
  	assert !(u3.role? :admin)
  end

  test "account label" do
  	u = users(:customer1)
  	assert_equal "John Bill", u.account_label
  end

  test "Roles order" do
  	assert_equal User.roles, User::ROLES
  	assert_equal ["customer", "manager", "admin"], User.roles
  end
end
