require 'test_helper'

class PlanSubjectsControllerTest < ActionController::TestCase
  setup do
    @plan_subject = plan_subjects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plan_subjects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plan_subject" do
    assert_difference('PlanSubject.count') do
      post :create, plan_subject: { plan_id: @plan_subject.plan_id, subject_id: @plan_subject.subject_id }
    end

    assert_redirected_to plan_subject_path(assigns(:plan_subject))
  end

  test "should show plan_subject" do
    get :show, id: @plan_subject
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plan_subject
    assert_response :success
  end

  test "should update plan_subject" do
    patch :update, id: @plan_subject, plan_subject: { plan_id: @plan_subject.plan_id, subject_id: @plan_subject.subject_id }
    assert_redirected_to plan_subject_path(assigns(:plan_subject))
  end

  test "should destroy plan_subject" do
    assert_difference('PlanSubject.count', -1) do
      delete :destroy, id: @plan_subject
    end

    assert_redirected_to plan_subjects_path
  end
end
