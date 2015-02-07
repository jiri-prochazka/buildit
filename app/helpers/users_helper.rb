module UsersHelper

	def edit_path(user)
		if user.class == Customer
			edit_customer_path(user)
		elsif user.class == Employee
			edit_employee_path(user)
		else
			"#"
		end
	end

	def change_type(user)
		if user.class == Customer
			link_to("Change to Employee", change_type_user_path(user), method: :put)
		elsif user.class == Employee
			link_to("Change to Customer", change_type_user_path(user), method: :put)
		else
			""
		end
	end

end
