require 'test_helper'

class DegreeRequirementsControllerTest < ActionController::TestCase
  setup do
    @degree_requirement = degree_requirements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:degree_requirements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create degree_requirement" do
    assert_difference('DegreeRequirement.count') do
      post :create, degree_requirement: { course_id: @degree_requirement.course_id, major_id: @degree_requirement.major_id, minor_id: @degree_requirement.minor_id }
    end

    assert_redirected_to degree_requirement_path(assigns(:degree_requirement))
  end

  test "should show degree_requirement" do
    get :show, id: @degree_requirement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @degree_requirement
    assert_response :success
  end

  test "should update degree_requirement" do
    patch :update, id: @degree_requirement, degree_requirement: { course_id: @degree_requirement.course_id, major_id: @degree_requirement.major_id, minor_id: @degree_requirement.minor_id }
    assert_redirected_to degree_requirement_path(assigns(:degree_requirement))
  end

  test "should destroy degree_requirement" do
    assert_difference('DegreeRequirement.count', -1) do
      delete :destroy, id: @degree_requirement
    end

    assert_redirected_to degree_requirements_path
  end
end
