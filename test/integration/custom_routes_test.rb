require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
 
 test "that '/login' opens login page" do
 	get '/login'
 	assert_response :success
 end

 test "that '/logout' opens login page" do
 	get '/logout'
 	assert_response :redirect
 	assert_redirected_to '/'
 end

  test "test '/register' opens register page" do
 	get '/register'
 	assert_response :success
 end

 test "test profile page works" do
 	get '/praveenkumar'
 	assert_response :success
 end


end
