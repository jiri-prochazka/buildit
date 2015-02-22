require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
	setup do
		delete_factories
	end

	test "create employee" do
		assert_difference "Employee.count" do
			c = Employee.create(email: "employee123@test.com", name: "John", surname: "employee", phone: "+420777123123", position: "senior", employed_since: "1.1.2001", password: "pass123124")
			assert_equal "Employee", c._type
			assert_equal "manager", c.role
			assert_not_nil c.encrypted_password
		end
	end

	test "check validations" do
		e = create(:employee1)
		assert_difference "Employee.count" do
			a = Employee.new
			assert !a.valid?
			assert a.errors.messages.include?(:name)
			assert a.errors.messages.include?(:surname)
			assert a.errors.messages.include?(:email)
			a.name = "Jim"
			a.surname = "Beam"
			a.email = e.email
			assert !a.valid?
			a.email = "bleh@blah.com"
			assert a.valid?
			assert a.save
		end
	end
end
