require "application_system_test_case"

class FligtsTest < ApplicationSystemTestCase
  test "add the flight" do
  	sign_in users(:superadmin) 
    visit flights_url

    click_on 'Dodaj lot'
    fill_in "flight_departure_airport_id", with: "19"
    fill_in "flight_departure_time", with: "10:00"

    click_on 'Zapisz'

    assert_selector "p", text: "Miejsca w klasie ekonomicznej: 320"
  end
end