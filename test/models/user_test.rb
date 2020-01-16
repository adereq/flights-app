require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "email validation should trigger" do 
  	assert_not User.new(first_name: "Adrian", last_name:"Kupiszewski").save
  end	
end
