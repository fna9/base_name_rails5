require 'test_helper'

class CommunityPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @community_page = community_pages(:one)
  end

  test "should get index" do
    get community_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_community_page_url
    assert_response :success
  end

  test "should create community_page" do
    assert_difference('CommunityPage.count') do
      post community_pages_url, params: { community_page: { community_id: @community_page.community_id, ismain: @community_page.ismain, page_id: @community_page.page_id } }
    end

    assert_redirected_to community_page_path(CommunityPage.last)
  end

  test "should show community_page" do
    get community_page_url(@community_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_community_page_url(@community_page)
    assert_response :success
  end

  test "should update community_page" do
    patch community_page_url(@community_page), params: { community_page: { community_id: @community_page.community_id, ismain: @community_page.ismain, page_id: @community_page.page_id } }
    assert_redirected_to community_page_path(@community_page)
  end

  test "should destroy community_page" do
    assert_difference('CommunityPage.count', -1) do
      delete community_page_url(@community_page)
    end

    assert_redirected_to community_pages_path
  end
end
