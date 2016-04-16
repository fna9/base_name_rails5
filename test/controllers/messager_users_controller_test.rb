require 'test_helper'

class MessagerUsersControllerTest < ActionController::TestCase
  setup do
    @messager_user = messager_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:messager_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create messager_user" do
    assert_difference('MessagerUser.count') do
      post :create, messager_user: { messager_id: @messager_user.messager_id, user_id: @messager_user.user_id }
    end

    assert_redirected_to messager_user_path(assigns(:messager_user))
  end

  test "should show messager_user" do
    get :show, id: @messager_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @messager_user
    assert_response :success
  end

  test "should update messager_user" do
    patch :update, id: @messager_user, messager_user: { messager_id: @messager_user.messager_id, user_id: @messager_user.user_id }
    assert_redirected_to messager_user_path(assigns(:messager_user))
  end

  test "should destroy messager_user" do
    assert_difference('MessagerUser.count', -1) do
      delete :destroy, id: @messager_user
    end

    assert_redirected_to messager_users_path
  end
end
