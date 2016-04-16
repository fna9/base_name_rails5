require 'test_helper'

class PageSubjectsControllerTest < ActionController::TestCase
  setup do
    @page_subject = page_subjects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:page_subjects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create page_subject" do
    assert_difference('PageSubject.count') do
      post :create, page_subject: { page_id: @page_subject.page_id, subject_id: @page_subject.subject_id }
    end

    assert_redirected_to page_subject_path(assigns(:page_subject))
  end

  test "should show page_subject" do
    get :show, id: @page_subject
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page_subject
    assert_response :success
  end

  test "should update page_subject" do
    patch :update, id: @page_subject, page_subject: { page_id: @page_subject.page_id, subject_id: @page_subject.subject_id }
    assert_redirected_to page_subject_path(assigns(:page_subject))
  end

  test "should destroy page_subject" do
    assert_difference('PageSubject.count', -1) do
      delete :destroy, id: @page_subject
    end

    assert_redirected_to page_subjects_path
  end
end
