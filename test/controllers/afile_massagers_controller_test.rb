require 'test_helper'

class AfileMassagersControllerTest < ActionController::TestCase
  setup do
    @afile_massager = afile_massagers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:afile_massagers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create afile_massager" do
    assert_difference('AfileMassager.count') do
      post :create, afile_massager: { afile_id: @afile_massager.afile_id, messager_id: @afile_massager.messager_id }
    end

    assert_redirected_to afile_massager_path(assigns(:afile_massager))
  end

  test "should show afile_massager" do
    get :show, id: @afile_massager
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @afile_massager
    assert_response :success
  end

  test "should update afile_massager" do
    patch :update, id: @afile_massager, afile_massager: { afile_id: @afile_massager.afile_id, messager_id: @afile_massager.messager_id }
    assert_redirected_to afile_massager_path(assigns(:afile_massager))
  end

  test "should destroy afile_massager" do
    assert_difference('AfileMassager.count', -1) do
      delete :destroy, id: @afile_massager
    end

    assert_redirected_to afile_massagers_path
  end
end
