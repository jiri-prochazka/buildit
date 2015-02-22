require 'test_helper'

class RequirementsControllerTest < ActionController::TestCase
  setup do
    delete_factories
    @requirement = create(:req_one)
    @requirement.project = create(:project_one)
    @requirement.save
    @user = create(:admin)
    @user.role = "admin"
    @user.save
    sign_in @user
    request.env["HTTP_REFERER"] = project_path(@requirement.project)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requirements)
  end

  test "should not get new" do
    get :new
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end

  test "should get new" do
    sign_in create(:customer1)
    get :new
    assert_response :success
  end

  test "should create requirement" do
    sign_in create(:customer1)
    assert_difference('Requirement.count') do
      post :create, requirement: { content: @requirement.content}, project_id: @requirement.project.id 
    end

    assert_redirected_to project_path(@requirement.project)
  end

  test "should not create requirement, not customer" do
    assert_no_difference('Requirement.count') do
      post :create, requirement: { content: @requirement.content}, project_id: @requirement.project.id 
    end
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end

  test "should not create requirement" do
    sign_in create(:employee1)
    assert_no_difference('Requirement.count') do
      post :create, requirement: { content: @requirement.content}, project_id: @requirement.project.id 
    end
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end

  test "should not create requirement, not valid" do
    sign_in create(:customer1)
      assert_no_difference('Requirement.count') do
      post :create, requirement: { content: nil}, project_id: @requirement.project.id 
    end
    assert_response :success
  end

  test "should show requirement" do
    get :show, id: @requirement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @requirement
    assert_response :success
  end

  test "should update requirement" do
    patch :update, id: @requirement, requirement: { content: @requirement.content, project_id: @requirement.project_id }
    assert_redirected_to requirement_path(assigns(:requirement))
  end

  test "should not update requirement, not valid" do
    patch :update, id: @requirement, requirement: { content: nil, project_id: @requirement.project_id }
    assert_response :success
  end

  test "should destroy requirement" do
    assert_difference('Requirement.count', -1) do
      delete :destroy, id: @requirement
    end

    assert_redirected_to requirements_path
  end
end
