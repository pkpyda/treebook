require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "user should enter first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "user should enter last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "user should enter profile name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "user should have unique profile name" do
  	user = User.new
  	user.profile_name = users(:praveen).profile_name
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "user should not have space between profile_name" do
  	user = User.new
  	user.profile_name = "My Name"
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end

  test "user profile name must be formatted correctly" do
    user = User.new(first_name: "praveen",last_name: "kumar",email: "p@gmail.com",password: "password", password_confirmation: "password",profile_name: "praveenpyda")
    assert user.save
    assert user.errors[:profile_name].empty?
  end
end
