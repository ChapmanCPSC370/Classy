require 'test_helper'

class MajorsControllerTest < ActionController::TestCase
  setup do
    @major = majors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:majors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create major" do
    assert_difference('Major.count') do
      post :create, major: { department_id: @major.department_id, description: @major.description, name: @major.name, university_id: @major.university_id }
    end

    assert_redirected_to major_path(assigns(:major))
  end

  test "should show major" do
    get :show, id: @major
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @major
    assert_response :success
  end

  test "should update major" do
    patch :update, id: @major, major: { department_id: @major.department_id, description: @major.description, name: @major.name, university_id: @major.university_id }
    assert_redirected_to major_path(assigns(:major))
  end

  test "should destroy major" do
    assert_difference('Major.count', -1) do
      delete :destroy, id: @major
    end

    assert_redirected_to majors_path
  end
end
