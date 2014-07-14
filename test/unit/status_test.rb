require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "status content cannot be empty" do
  	status = Status.new
  	assert !status.save
  	assert !status.errors[:context].empty?
  end

  test "status content should have minimum length size:2" do
  	status = Status.new(context: "h")
  	assert !status.save
  	assert !status.errors[:context].empty?
  end

  test "user_id must for generating status" do
  	status = Status.new(context: "hello")
  	assert !status.save
  	assert !status.errors[:user_id].empty?
  end
end
