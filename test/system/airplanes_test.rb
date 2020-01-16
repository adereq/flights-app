require "application_system_test_case"

class AirplanesTest < ApplicationSystemTestCase
  test "add the airplane" do
  	sign_in users(:superadmin) 
    visit airplanes_url

    click_on 'Dodaj samolot'
    fill_in "airplane_model", with: "Airbus A320"
    fill_in "airplane_economy_seats", with: "320"
    fill_in "airplane_business_seats", with: "100"

    click_on 'Zapisz'
    assert_selector "p", text: "Miejsca w klasie ekonomicznej: 320"
  end
end