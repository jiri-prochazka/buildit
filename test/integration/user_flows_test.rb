require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
	setup do
		
	end

	test "login" do
		get "/users/sign_up"
		assert_response :success

	  	get "/users/sign_in"
	    assert_response :success
	 
	    post_via_redirect "/users/sign_in", "user[email]" => users(:admin).email, "user[password]" => "admin"
	    assert_equal "Signed in successfully.", flash[:notice]
	    assert_equal '/', path
	end
end
