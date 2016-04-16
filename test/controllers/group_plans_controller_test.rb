require 'test_helper'

class GroupPlansControllerTest < ActionController::TestCase
  setup do
    @group_plan = group_plans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_plan" do
    assert_difference('GroupPlan.count') do
      post :create, group_plan: {  }
    end

    assert_redirected_to group_plan_path(assigns(:group_plan))
  end

  test "should show group_plan" do
    get :show, id: @group_plan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group_plan
    assert_response :success
  end

  test "should update group_plan" do
    patch :update, id: @group_plan, group_plan: {  }
    assert_redirected_to group_plan_path(assigns(:group_plan))
  end

  test "should destroy group_plan" do
    assert_difference('GroupPlan.count', -1) do
      delete :destroy, id: @group_plan
    end

    assert_redirected_to group_plans_path
  end
end
