require 'test_helper'

class GroupStudentsControllerTest < ActionController::TestCase
  setup do
    @group_student = group_students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_student" do
    assert_difference('GroupStudent.count') do
      post :create, group_student: { group_id: @group_student.group_id, student_id: @group_student.student_id }
    end

    assert_redirected_to group_student_path(assigns(:group_student))
  end

  test "should show group_student" do
    get :show, id: @group_student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group_student
    assert_response :success
  end

  test "should update group_student" do
    patch :update, id: @group_student, group_student: { group_id: @group_student.group_id, student_id: @group_student.student_id }
    assert_redirected_to group_student_path(assigns(:group_student))
  end

  test "should destroy group_student" do
    assert_difference('GroupStudent.count', -1) do
      delete :destroy, id: @group_student
    end

    assert_redirected_to group_students_path
  end
end
