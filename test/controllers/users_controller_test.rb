require 'test_helper'

class UsersControllerTest < ActionController::TestCase
	
  setup do
    @user = users(:admin)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
