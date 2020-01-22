require 'test_helper'

class AirplanesControllerTest < ActionDispatch::IntegrationTest 

  setup do 
  	@airplane = airplanes(:airplane_one)
  end

  test "superadmin should get index" do
  	sign_in users(:superadmin)
  	get airplanes_url
  	assert_response :success
  end

  test "airline_manager should get index" do
  	sign_in users(:airline_manager)
  	get airplanes_url
  	assert_response :success
  end

  test "airport_manager should not get index" do
  	sign_in users(:airport_manager)
  	get airplanes_url
  	assert_response(403)
  end

  test "client should not get index" do
  	sign_in users(:client)
  	get airplanes_url
  	assert_response(403)
  end

  test "guest should not get index and redirect to login page" do
  	get airplanes_url
  	assert_redirected_to new_user_session_url
  end

  test "should get new" do 
  	sign_in users(:superadmin)
  	get new_airplane_url
  	assert_response :success
  end

  test "should create airplane" do
  	sign_in users(:superadmin)
  	assert_difference('Airplane.count') do 
  	  post airplanes_url, params: {airplane: {model: @airplane.model, economy_seats: @airplane.economy_seats, business_seats: @airplane.business_seats}}
  	end
  	assert_redirected_to airplane_url(Airplane.last)
  end

  test "should show" do
  	sign_in users(:superadmin)
  	get airplane_url(@airplane)
  	assert_response :success
  end

  test "should get edit" do 
  	sign_in users(:superadmin)
  	get edit_airplane_url(@airplane)
  	assert_response :success
  end

  test "should update" do
  	sign_in users(:superadmin)
  	patch airplane_url(@airplane), params: {airplane: {model: @airplane.model, economy_seats: @airplane.economy_seats, business_seats: @airplane.business_seats}}
  	assert_redirected_to airplane_url(@airplane)
  end

  test "should destroy" do 
  	sign_in users(:superadmin)
  	assert_difference('Airplane.count', -1) do
  	  delete airplane_url(@airplane)
  	end
  	assert_redirected_to airplanes_url 
  end

end
