FactoryGirl.define do
	factory :customer1, class: Customer do
	  name "John"
	  surname "Bill"
	  phone "+420123123123"
	  email "test@test.com"
	  salutation "Mr."
	  nationality "CZ"
	  newsletter false
	  role "customer"
	end

	factory :customer2, class: Customer do
	  name "Jim"
	  surname "Good"
	  phone "+420123123123"
	  email "jim@teeee.com"
	  salutation "Mr."
	  nationality "UK"
	  newsletter true
	  role "customer"
	end

	factory :employee1, class: Employee do
	  name "Jim"
	  surname "Canada"
	  phone "+421989123123"
	  email "employee@test.com"
	  employed_since "2015-02-01 18:24:23"
	  admin false
	  position "senior"
	  role "manager"
	end

	factory :admin, class: Employee do
	  name "admin"
	  surname "Main"
	  phone "777123123"
	  email "admin@admin.com"
	  type "Employee"
	  role "admin"
	  encrypted_password "$2a$10$awFajhPzWJ0SZNbzvvs23erNyoVU/RUCXzSsUmrE30M1FZUF7jEAe"
	end
end