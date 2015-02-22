require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    delete_factories
    @customer1 = create(:customer1)
    @concept1 = create(:concept_one)

    @project = build(:project_one)
    @project.jobs = [create(:job_one),create(:job_two)]
    @project.customer = @customer1
    @project.concept = @concept1
    @project.save

    p2 = create(:project_two)
    p3 = build(:project_three)
    p3.jobs = [create(:job_three)]
    p3.save
    @user = create(:employee1)
    @new_concept = create(:concept_four)
    
    sign_in @user
    request.env["HTTP_REFERER"] = concepts_url
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
    assert_equal 1, assigns(:projects).size
  end

  test "should get index, completed" do
    get :index, cat: "completed"
    assert_response :success
    assert_not_nil assigns(:projects)
    assert_equal 1, assigns(:projects).size
  end

  test "should get index, archived" do
    get :index, cat: "archived"
    assert_response :success
    assert_not_nil assigns(:projects)
    assert_equal 1, assigns(:projects).size
  end

  test "should not get new" do
    get :new
    assert_response :redirect
    assert_equal "Can't create project without a concept", flash[:alert]
  end

  test "should get new" do
    get :new, concept_id: @new_concept.id
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { archived: @project.archived, completed_at: @project.completed_at, estimated_finish: @project.estimated_finish, name: @project.name}, concept_id: @new_concept.id 
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should not create project, not valid" do
    assert_no_difference('Project.count') do
      post :create, project: { name: nil}, concept_id: @new_concept.id 
    end
    assert_response :success
  end

  test "should not create project, concept has project" do
    assert_no_difference('Project.count') do
      post :create, project: { name: "newww"}, concept_id: @concept1.id
    end
    assert_response :success
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    patch :update, id: @project, project: { archived: @project.archived, completed_at: @project.completed_at, estimated_finish: @project.estimated_finish, name: @project.name }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should not update project, not valid" do
    patch :update, id: @project, project: { archived: @project.archived, completed_at: @project.completed_at, estimated_finish: @project.estimated_finish, name: nil }
    assert_response :success
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end

  test "should archive project" do
    assert !@project.archived
    put :archive, id: @project
    @project.reload
    assert @project.archived
  end


  test "should get index for customer1" do
    sign_in @customer1
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
    assert_equal 1, assigns(:projects).size
  end

  test "should get index, completed, for customer1" do
    sign_in @customer1
    get :index, cat: "completed"
    assert_response :success
    assert_not_nil assigns(:projects)
    assert_equal 0, assigns(:projects).size
  end

  test "should get index, archived, for customer1" do
    sign_in @customer1
    get :index, cat: "archived"
    assert_response :success
    assert_not_nil assigns(:projects)
    assert_equal 0, assigns(:projects).size
  end

  test "should not get edit" do
    sign_in @customer1
    get :edit, id: @project
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end

  test "should not update project" do
    sign_in @customer1
    patch :update, id: @project, project: { archived: @project.archived, completed_at: @project.completed_at, estimated_finish: @project.estimated_finish, name: @project.name }
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end

  test "should not destroy project" do
    sign_in @customer1
    assert_no_difference('Project.count') do
      delete :destroy, id: @project
    end
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end
end
