require 'test_helper'

class AfileMessagersControllerTest < ActionController::TestCase
  setup do
    @afile_messager = afile_messagers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:afile_messagers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create afile_messager" do
    assert_difference('AfileMessager.count') do
      post :create, afile_messager: { afile_id: @afile_messager.afile_id, messager_id: @afile_messager.messager_id }
    end

    assert_redirected_to afile_messager_path(assigns(:afile_messager))
  end

  test "should show afile_messager" do
    get :show, id: @afile_messager
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @afile_messager
    assert_response :success
  end

  test "should update afile_messager" do
    patch :update, id: @afile_messager, afile_messager: { afile_id: @afile_messager.afile_id, messager_id: @afile_messager.messager_id }
    assert_redirected_to afile_messager_path(assigns(:afile_messager))
  end

  test "should destroy afile_messager" do
    assert_difference('AfileMessager.count', -1) do
      delete :destroy, id: @afile_messager
    end

    assert_redirected_to afile_messagers_path
  end
end
