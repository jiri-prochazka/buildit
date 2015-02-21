require 'test_helper'

class AddressesControllerTest < ActionController::TestCase
  setup do
    @address = addresses(:one)
    @user = users(:admin)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:addresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create address" do
    assert_difference('Address.count') do
      post :create, address: { city: @address.city, country: @address.country, street: @address.street, user_id: @address.user_id, zip: @address.zip }
    end
    assert_redirected_to edit_user_registration_path
  end

  test "should not create address, not valid" do
    assert_no_difference('Address.count') do
      post :create, address: {country: @address.country, user_id: @address.user_id }
    end
  end

  test "should get edit" do
    get :edit, id: @address
    assert_response :success
  end

  test "should update address" do
    patch :update, id: @address, address: { city: @address.city, country: @address.country, street: @address.street, user_id: @address.user_id, zip: @address.zip }
    assert_redirected_to edit_user_registration_path
  end

  test "should not update address, not valid" do
    patch :update, id: @address, address: { city: nil }
  end

  test "should destroy address" do
    assert_difference('Address.count', -1) do
      delete :destroy, id: @address
    end

    assert_redirected_to addresses_path
  end

  test "should not get index as manager" do
    sign_in users(:employee1)
    get :index
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
    assert_empty assigns(:addresses)
  end

  test "should not get edit" do
    sign_in users(:employee1)
    get :edit, id: @address
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end

  test "should not update address" do
    sign_in users(:employee1)
    patch :update, id: @address, address: { city: @address.city, country: @address.country, street: @address.street, user_id: @address.user_id, zip: @address.zip }
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end

  test "should get my edit" do
    sign_in users(:employee1)
    get :edit, id: addresses(:two)
    assert_response :success
  end

  test "should update my address" do
    sign_in users(:employee1)
    @address = addresses(:two)
    patch :update, id: @address, address: { city: @address.city, country: @address.country, street: @address.street, user_id: @address.user_id, zip: @address.zip }
    assert_redirected_to edit_user_registration_path
  end

  test "should not destroy address" do
    sign_in users(:employee1)
    assert_no_difference('Address.count') do
      delete :destroy, id: @address
    end

    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end

end
