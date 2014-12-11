require 'test_helper'

class LearningResourcesControllerTest < ActionController::TestCase
  setup do
    @learning_resource = learning_resources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:learning_resources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create learning_resource" do
    assert_difference('LearningResource.count') do
      post :create, learning_resource: { description: @learning_resource.description, name: @learning_resource.name, resourceurl: @learning_resource.resourceurl, section_id: @learning_resource.section_id }
    end

    assert_redirected_to learning_resource_path(assigns(:learning_resource))
  end

  test "should show learning_resource" do
    get :show, id: @learning_resource
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @learning_resource
    assert_response :success
  end

  test "should update learning_resource" do
    patch :update, id: @learning_resource, learning_resource: { description: @learning_resource.description, name: @learning_resource.name, resourceurl: @learning_resource.resourceurl, section_id: @learning_resource.section_id }
    assert_redirected_to learning_resource_path(assigns(:learning_resource))
  end

  test "should destroy learning_resource" do
    assert_difference('LearningResource.count', -1) do
      delete :destroy, id: @learning_resource
    end

    assert_redirected_to learning_resources_path
  end
end
