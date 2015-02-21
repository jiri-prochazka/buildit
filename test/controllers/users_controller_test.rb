require 'test_helper'

class UsersControllerTest < ActionController::TestCase
	
  setup do
    @user = users(:admin)
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
		  	put :change_type, id: users(:customer1)
		end
	end

	assert_difference("Employee.count", -1) do
  		assert_difference("Customer.count") do
		  	put :change_type, id: users(:employee1)
		end
	end
  end

end
