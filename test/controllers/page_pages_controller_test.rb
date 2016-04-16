require 'test_helper'

class PagePagesControllerTest < ActionController::TestCase
  setup do
    @page_page = page_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:page_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create page_page" do
    assert_difference('PagePage.count') do
      post :create, page_page: { page_id: @page_page.page_id, page_id: @page_page.page_id }
    end

    assert_redirected_to page_page_path(assigns(:page_page))
  end

  test "should show page_page" do
    get :show, id: @page_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page_page
    assert_response :success
  end

  test "should update page_page" do
    patch :update, id: @page_page, page_page: { page_id: @page_page.page_id, page_id: @page_page.page_id }
    assert_redirected_to page_page_path(assigns(:page_page))
  end

  test "should destroy page_page" do
    assert_difference('PagePage.count', -1) do
      delete :destroy, id: @page_page
    end

    assert_redirected_to page_pages_path
  end
end
