require 'test_helper'

class AirportsControllerTest < ActionDispatch::IntegrationTest
  setup do 
  	@airport = airports(:airport_one)
  end

  test "superadmin should get index" do
  	sign_in users(:superadmin)
  	get airports_url
  	assert_response :success
  end

  test "airline_manager should get index" do
  	sign_in users(:airline_manager)
  	get airports_url
  	assert_response :success
  end

  test "airport_manager should not get index" do
  	sign_in users(:airport_manager)
  	get airports_url
  	assert_response(403)
  end

  test "client should not get index" do
  	sign_in users(:client)
  	get airports_url
  	assert_response(403)
  end

  test "guest should not get index and redirect to login page" do
  	get airports_url
  	assert_redirected_to new_user_session_url
  end

  test "should get new" do 
  	sign_in users(:superadmin)
  	get new_airport_url
  	assert_response :success
  end

  test "should create airport" do
  	sign_in users(:superadmin)
  	assert_difference('Airport.count', 1) do 
  	  post airports_url, params: {airport: {city: @airport.city, country: @airport.country, name: @airport.name, timezone: @airport.timezone, iata: "WRY"}}
  	end
  	assert_redirected_to airport_url(Airport.last)
  end

  test "should not create the airport with the same iata code" do
  	sign_in users(:superadmin)
  	assert_difference('Airport.count', 0) do 
  	  post airports_url, params: {airport: {city: @airport.city, country: @airport.country, name: @airport.name, timezone: @airport.timezone, iata: @airport.iata}}
  	end
  end


  test "should show" do
  	sign_in users(:superadmin)
  	get airport_url(@airport)
  	assert_response :success
  end

  test "should get edit" do 
  	sign_in users(:superadmin)
  	get edit_airport_url(@airport)
  	assert_response :success
  end

  test "should update" do
  	sign_in users(:superadmin)
  	patch airport_url(@airport), params: {airport: {city: @airport.city, country: @airport.country, name: @airport.name, timezone: @airport.timezone, iata: @airport.iata}}
  	assert_redirected_to airport_url(@airport)
  end

  test "should destroy" do 
  	sign_in users(:superadmin)
  	assert_difference('Airport.count', -1) do
  	  delete airport_url(@airport)
  	end
  	assert_redirected_to airports_url 
  end

end
