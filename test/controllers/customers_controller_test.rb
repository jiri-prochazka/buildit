require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    delete_factories
    @customer = create(:customer1)
    @user = create(:admin)
    @user.role = "admin"
    @user.save
    sign_in @user
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, customer: { email: "blah@blue.eu", name: @customer.name, nationality: @customer.nationality, newsletter: @customer.newsletter, phone: @customer.phone, salutation: @customer.salutation, surname: @customer.surname }
    end
    assert_redirected_to users_path
  end

  test "should not create customer, not valid" do
    assert_no_difference('Customer.count') do
      post :create, customer: { email: "blah@blue.eu" }
    end
  end

  test "should get edit" do
    get :edit, id: @customer
    assert_response :success
  end

  test "should update customer" do
    patch :update, id: @customer, customer: { email: @customer.email, name: @customer.name, nationality: @customer.nationality, newsletter: @customer.newsletter, phone: @customer.phone, salutation: @customer.salutation, surname: @customer.surname }
    assert_redirected_to users_path
  end

  test "should not update customer, not valid" do
    patch :update, id: @customer, customer: { email: nil, name: nil, nationality: @customer.nationality, newsletter: @customer.newsletter, phone: @customer.phone, salutation: @customer.salutation, surname: @customer.surname }
    assert_response :success
  end

  test "should not get new" do
    sign_in create(:employee1)
    get :new
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end

  test "should not create customer" do
    sign_in create(:employee1)
    assert_no_difference('Customer.count') do
      post :create, customer: { email: "blahi@blue.eu", name: @customer.name, nationality: @customer.nationality, newsletter: @customer.newsletter, phone: @customer.phone, salutation: @customer.salutation, surname: @customer.surname }
    end
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end

  test "should not get edit" do
    sign_in create(:employee1)
    get :edit, id: @customer
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end

  test "should not update customer" do
    sign_in create(:employee1)
    patch :update, id: @customer, customer: { email: @customer.email, name: @customer.name, nationality: @customer.nationality, newsletter: @customer.newsletter, phone: @customer.phone, salutation: @customer.salutation, surname: @customer.surname }
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end

end
