require 'test_helper'

class ConceptsControllerTest < ActionController::TestCase
  setup do
    delete_factories
    @concept = create(:concept_one)
    @concept.user = create(:customer2)
    @concept.save
    @user = create(:employee1)
    sign_in @user
    request.env["HTTP_REFERER"] = concepts_url
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:concepts)
    assert_equal Concept.all.size, assigns(:concepts).size
  end

  test "should create concept" do
    assert_difference('Concept.count') do
      post :create, concept: { description: @concept.description, end_at: @concept.end_at, name: @concept.name, price: @concept.price, start_at: @concept.start_at }
    end
    assert_redirected_to concepts_url
  end

  test "should not create concept not valid" do
    assert_no_difference('Concept.count') do
      post :create, concept: {price: 100}
    end
    assert_redirected_to concepts_url
    assert_equal "Wrong input fields for concept", flash[:alert]
  end


  test "should get edit" do
    xhr :get, :edit, id: @concept, format: :js
    assert_response :success
  end

  test "should update concept" do
    patch :update, id: @concept, concept: { description: @concept.description, end_at: @concept.end_at, name: @concept.name, price: @concept.price, start_at: @concept.start_at }
    assert_redirected_to concepts_url
  end

  test "should not update concept not valid" do
    patch :update, id: @concept, concept: { name: nil }
    assert_redirected_to concepts_url
    assert_equal "Wrong input fields for concept", flash[:alert]
  end

  test "should archive concept" do
    assert !@concept.archived
    put :archive, id: @concept
    @concept.reload
    assert @concept.archived
  end

  test "should get index with my" do
    c = create(:customer1)
    sign_in c
    c.concepts = [create(:concept_two)]
    c.save
    get :index
    assert_response :success
    assert_not_nil assigns(:concepts)
    assert_equal 1, assigns(:concepts).size
  end

  test "should not get edit" do
    sign_in create(:customer1)
    xhr :get, :edit, id: @concept, format: :js
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end

  test "should not update concept" do
    sign_in create(:customer1)
    patch :update, id: @concept, concept: { description: @concept.description, end_at: @concept.end_at, name: @concept.name, price: @concept.price, start_at: @concept.start_at }
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end
end
