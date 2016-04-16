require 'test_helper'

class TalkUsersControllerTest < ActionController::TestCase
  setup do
    @talk_user = talk_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:talk_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create talk_user" do
    assert_difference('TalkUser.count') do
      post :create, talk_user: { talk_id: @talk_user.talk_id, user_id: @talk_user.user_id }
    end

    assert_redirected_to talk_user_path(assigns(:talk_user))
  end

  test "should show talk_user" do
    get :show, id: @talk_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @talk_user
    assert_response :success
  end

  test "should update talk_user" do
    patch :update, id: @talk_user, talk_user: { talk_id: @talk_user.talk_id, user_id: @talk_user.user_id }
    assert_redirected_to talk_user_path(assigns(:talk_user))
  end

  test "should destroy talk_user" do
    assert_difference('TalkUser.count', -1) do
      delete :destroy, id: @talk_user
    end

    assert_redirected_to talk_users_path
  end
end
