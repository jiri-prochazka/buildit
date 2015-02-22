require 'test_helper'

class UsersControllerTest < ActionController::TestCase
	
  setup do
    delete_factories
    @user = create(:admin)
    @user.role = "admin"
    @user.save
    @c = create(:customer1)
    @e = create(:employee1)
    sign_in @user
    request.env["HTTP_REFERER"] = users_path
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "change user type" do
  	assert_difference("Employee.count") do
  		assert_difference("Customer.count", -1) do
		  	put :change_type, id: @c
		end
	end

	assert_difference("Employee.count", -1) do
  		assert_difference("Customer.count") do
		  	put :change_type, id: @e
		end
	end
  end

end
