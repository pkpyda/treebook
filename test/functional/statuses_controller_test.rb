require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
    @status = statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuses)
  end

  test "should be redirected when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should render new page when user logged in" do
    sign_in users(:praveen)
    get :new
    assert_response :success
  end

  test "should be redirected to login page when user not login" do
    post :create, status: {context: @status.context}
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create status when user logged in" do
    sign_in users(:praveen)
    assert_difference('Status.count') do
      post :create, status: {context: @status.context}
    end

    assert_redirected_to status_path(assigns(:status))
  end

  test "should show status" do
    get :show, id: @status
    assert_response :success
  end

  test "should get redirected to login page if user logged in" do
    get :edit, id: @status
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should goto edit page when logged in" do 
    sign_in users(:praveen)
    get :edit, id: @status
    assert_response :success
  end

  test "should redirected to login page if user logged in" do
    put :update, id: @status, status: {context: @status.context}
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should get update status if user logged in" do
    sign_in users(:praveen)
    put :update, id: @status, status: {context: @status.context}
    assert_redirected_to status_path(assigns(:status))
  end

  test "should destroy status" do
    assert_difference('Status.count', -1) do
      delete :destroy, id: @status
    end

    assert_redirected_to statuses_path
  end
end
