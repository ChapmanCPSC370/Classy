require 'test_helper'

class CompletedCoursesControllerTest < ActionController::TestCase
  setup do
    @completed_course = completed_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:completed_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create completed_course" do
    assert_difference('CompletedCourse.count') do
      post :create, completed_course: { course_id: @completed_course.course_id, grade: @completed_course.grade, section_id: @completed_course.section_id, term: @completed_course.term, user_id: @completed_course.user_id }
    end

    assert_redirected_to completed_course_path(assigns(:completed_course))
  end

  test "should show completed_course" do
    get :show, id: @completed_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @completed_course
    assert_response :success
  end

  test "should update completed_course" do
    patch :update, id: @completed_course, completed_course: { course_id: @completed_course.course_id, grade: @completed_course.grade, section_id: @completed_course.section_id, term: @completed_course.term, user_id: @completed_course.user_id }
    assert_redirected_to completed_course_path(assigns(:completed_course))
  end

  test "should destroy completed_course" do
    assert_difference('CompletedCourse.count', -1) do
      delete :destroy, id: @completed_course
    end

    assert_redirected_to completed_courses_path
  end
end
