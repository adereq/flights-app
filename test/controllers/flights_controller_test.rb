require 'test_helper'

class FlightsControllerTest < ActionDispatch::IntegrationTest
  setup do 
    @flight = flights(:flight_one)
  end


  test "should get edit" do 
    sign_in users(:superadmin)
    get edit_flight_url(@flight)
    assert_response :success
  end

  test "should destroy" do 
    sign_in users(:superadmin)
    assert_difference('Flight.count', -1) do
      delete flight_url(@flight)
    end
    assert_redirected_to flights_url 
  end
end