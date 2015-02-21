require 'test_helper'

class EmployeesControllerTest < ActionController::TestCase
  setup do
    @employee = users(:employee1)
    @user = users(:admin)
    sign_in @user
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post :create, employee: { email: "blah@blue.eu", name: @employee.name, nationality: @employee.nationality, newsletter: @employee.newsletter, phone: @employee.phone, salutation: @employee.salutation, surname: @employee.surname }
    end
    assert_redirected_to users_path
  end

  test "should not create employee, not valid" do
    assert_no_difference('Employee.count') do
      post :create, employee: { email: "blah@blue.eu" }
    end
  end

  test "should get edit" do
    get :edit, id: @employee
    assert_response :success
  end

  test "should update employee" do
    patch :update, id: @employee, employee: { email: @employee.email, name: @employee.name, nationality: @employee.nationality, newsletter: @employee.newsletter, phone: @employee.phone, salutation: @employee.salutation, surname: @employee.surname }
    assert_redirected_to users_path
  end

  test "should not update employee, not valid" do
    patch :update, id: @employee, employee: { email: nil, name: nil, nationality: @employee.nationality, newsletter: @employee.newsletter, phone: @employee.phone, salutation: @employee.salutation, surname: @employee.surname }
    assert_response :success
  end

  test "should not get new" do
    sign_in users(:employee1)
    get :new
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end

  test "should not create employee" do
    sign_in users(:employee1)
    assert_no_difference('Employee.count') do
      post :create, employee: { email: "blahi@blue.eu", name: @employee.name, nationality: @employee.nationality, newsletter: @employee.newsletter, phone: @employee.phone, salutation: @employee.salutation, surname: @employee.surname }
    end
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end

  test "should not get edit" do
    sign_in users(:employee1)
    get :edit, id: @employee
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end

  test "should not update employee" do
    sign_in users(:employee1)
    patch :update, id: @employee, employee: { email: @employee.email, name: @employee.name, nationality: @employee.nationality, newsletter: @employee.newsletter, phone: @employee.phone, salutation: @employee.salutation, surname: @employee.surname }
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end
end
