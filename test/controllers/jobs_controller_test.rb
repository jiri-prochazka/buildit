require 'test_helper'

class JobsControllerTest < ActionController::TestCase
  setup do
    delete_factories
    @user = create(:admin)
    @user.role = "admin"
    @user.save
    @job = create(:job_two)
    @project = create(:project_one)
    @job.project = @project
    @project.employee = @user
    @project.save
    @job.save
    
    sign_in @user
    request.env["HTTP_REFERER"] = project_path(@job.project)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job" do
    assert_difference('Job.count') do
      post :create, job: { completed_at: @job.completed_at, confirmed_at: @job.confirmed_at, description: @job.description, estimated_price: @job.estimated_price, estimated_time: @job.estimated_time, name: @job.name, progress: @job.progress, project_id: @job.project_id, real_price: @job.real_price }
    end

    assert_redirected_to job_path(assigns(:job))
  end

  test "should not create job, not valid" do
    assert_no_difference('Job.count') do
      post :create, job: { name: nil}
    end
    assert_response :success
  end

  test "should show job" do
    get :show, id: @job.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job.id
    assert_response :success
  end

  test "should update job" do
    patch :update, id: @job.id, job: { completed_at: @job.completed_at, confirmed_at: @job.confirmed_at, description: @job.description, estimated_price: @job.estimated_price, estimated_time: @job.estimated_time, name: @job.name, progress: @job.progress, project_id: @job.project_id, real_price: @job.real_price }
    assert_redirected_to job_path(assigns(:job))
  end

  test "should not update job, not valid" do
    patch :update, id: @job.id, job: { name: nil, progress: @job.progress, project_id: @job.project_id, real_price: @job.real_price }
    assert_response :success
  end

  test "should destroy job" do
    assert_difference('Job.count', -1) do
      delete :destroy, id: @job.id
    end

    assert_redirected_to jobs_path
  end



  test "should not get index" do
    sign_in create(:customer1)
    get :index
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end

  test "should not get new" do
    sign_in create(:customer1)
    get :new
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end

  test "should not create job" do
    sign_in create(:customer1)
    assert_no_difference('Job.count') do
      post :create, job: { completed_at: @job.completed_at, confirmed_at: @job.confirmed_at, description: @job.description, estimated_price: @job.estimated_price, estimated_time: @job.estimated_time, name: @job.name, progress: @job.progress, project_id: @job.project_id, real_price: @job.real_price }
    end
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end

  test "should not show job" do
    sign_in create(:customer1)
    get :show, id: @job.id
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end

  test "should not get edit" do
    sign_in create(:customer1)
    get :edit, id: @job.id
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end

  test "should not update job" do
    sign_in create(:customer1)
    patch :update, id: @job.id, job: { completed_at: @job.completed_at, confirmed_at: @job.confirmed_at, description: @job.description, estimated_price: @job.estimated_price, estimated_time: @job.estimated_time, name: @job.name, progress: @job.progress, project_id: @job.project_id, real_price: @job.real_price }
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end

  test "should not destroy job" do
    sign_in create(:customer1)
    assert_no_difference('Job.count') do
      delete :destroy, id: @job.id
    end
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end

  test "should approve job" do
    c = create(:customer1)
    @project.customer = c
    @project.save
    sign_in c
    assert @job.confirmed_at.nil?
    put :approve, id: @job.id
    @job.reload
    assert_not_nil @job.confirmed_at
  end

  test "should not approve job" do
    sign_in create(:employee1)
    assert @job.confirmed_at.nil?
    put :approve, id: @job.id
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end
end
