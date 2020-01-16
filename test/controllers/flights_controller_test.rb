require 'test_helper'

class FlightsControllerTest < ActionDispatch::IntegrationTest
  setup do 
    @flight = flights(:flight_one)
  end

  test "superadmin should get index" do
    sign_in users(:superadmin)
    get flights_url
    assert_response :success
  end

  test "airline_manager should get index" do
    sign_in users(:airline_manager)
    get flights_url
    assert_response :success
  end

  test "airport_manager should not get index" do
    sign_in users(:airport_manager)
    get flights_url
    assert_response(403)
  end

  test "client should not get index" do
    sign_in users(:client)
    get flights_url
    assert_response(403)
  end

  test "guest should not get index and redirect to login page" do
    get flights_url
    assert_redirected_to new_user_session_url
  end

  test "should get new" do 
    sign_in users(:superadmin)
    get new_flight_url
    assert_response :success
  end

  test "should create flight" do
    sign_in users(:superadmin)
    assert_difference('Flight.count', 1) do 
      post flights_url, params: {flight: {departure_airport_id: @aflight.departure_airport_id, arrival_airport_id: @flight.arrival_airport_id, departure_date: @flight.departure_date, departure_time: @flight.departure_time, arrival_time: @flight.arrival_time, flight_number: @flight.flight_number, airplane_id: @flight.airplane_id, economy_price: @flight.economy_price, economy_seats: @flight.economy_seats, economy_free_seats: @flight.economy_free_seats, business_price: @flight.business_price, business_free_seats: @flight.business_free_seats, business_seats: @flight.business_seats}}
    end
    assert_redirected_to flight_url(Flight.last)
  end

  test "should not create the flight with the same airport_id" do
    sign_in users(:superadmin)
    assert_difference('Flight.count', 0) do 
      post flights_url, params: {flight: {departure_airport_id: 1, arrival_airport_id: 1, departure_date: @flight.departure_date, departure_time: @flight.departure_time, arrival_time: @flight.arrival_time, flight_number: @flight.flight_number, airplane_id: @flight.airplane_id, economy_price: @flight.economy_price, economy_seats: @flight.economy_seats, economy_free_seats: @flight.economy_free_seats, business_price: @flight.business_price, business_free_seats: @flight.business_free_seats, business_seats: @flight.business_seats}}
    end
  end

  test "should show" do
    sign_in users(:superadmin)
    get flight_url(@flightt)
    assert_response :success
  end

  test "should get edit" do 
    sign_in users(:superadmin)
    get edit_flight_url(@flight)
    assert_response :success
  end

  test "should update" do
    sign_in users(:superadmin)
    patch flight_url(@flight), params: {flight: {departure_airport_id: @aflight.departure_airport_id, arrival_airport_id: @flight.arrival_airport_id, departure_date: @flight.departure_date, departure_time: @flight.departure_time, arrival_time: @flight.arrival_time, flight_number: @flight.flight_number, airplane_id: @flight.airplane_id, economy_price: @flight.economy_price, economy_seats: @flight.economy_seats, economy_free_seats: @flight.economy_free_seats, business_price: @flight.business_price, business_free_seats: @flight.business_free_seats, business_seats: @flight.business_seats}}    
    assert_redirected_to flight_url(@flight)
  end

  test "should destroy" do 
    sign_in users(:superadmin)
    assert_difference('Flight.count', -1) do
      delete flight_url(@flight)
    end
    assert_redirected_to flights_url 
  end
end