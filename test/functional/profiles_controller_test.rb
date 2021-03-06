require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:praveen).profile_name
    assert_response :success
    assert_template "profiles/show"
  end

  test "render 404 not found page when profile doesn't exist" do
  	get :show, id: "doesn't exist"
  	assert_response :not_found
  end

  test "variables are assigned on profile show page" do
  	get :show, id: users(:praveen).profile_name
  	assert assigns(:user)
  	assert_not_empty assigns(:statuses)
  end

  test "only show correct user statuses" do
  	get :show, id: users(:praveen).profile_name
  	assigns(:statuses).each do |status|
  		assert_equal users(:praveen), status.user
  	end
  end


end
