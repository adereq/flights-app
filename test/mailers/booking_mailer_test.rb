require 'test_helper'

class BookingMailerTest < ActionMailer::TestCase
 
  test "booking_notification" do
   	@airport_1 = Airport.create(id:1, city: "Nowy Jork", country: "USA", name: "JFK", iata: "JFK", timezone: "UTC+6")
   	@airport_2 = Airport.create(id:2, city: "Warszawa", country: "Polska", name: "Warszawa-Modlin", iata: "WMI", timezone: "UTC+1")
  	@flight = Flight.create(departure_airport_id: 1, arrival_airport_id: 2, departure_date: "2020-01-19", departure_time: "2000-01-01 20:05:00", arrival_time: "2000-01-01 22:11:00", flight_number: "A89", created_at: "2020-01-19 19:40:15", updated_at: "2020-01-19 21:35:39", airplane_id: 14, economy_seats: 198, business_seats: 20, economy_free_seats: 194, business_free_seats: 12, economy_price: 100, business_price: 200)
   	@flight_id = Flight.last.id
   	@test_booking = Booking.create( pnr: "K5LIV95F", total_price: 99.0, flight_id: @flight_id, booking_class: "economy", passengers: 1, mail: "kupiszewskiadrian@gmail.com", user_id: 1, first_name_1: "Adrian", last_name_1: "Kupiszewski", document_1: "909090", seat_1: "E-5", price_1: 0.99e2, first_name_2: nil, last_name_2: nil, document_2: nil, seat_2: nil, price_2: nil, first_name_3: nil, last_name_3: nil, document_3: nil, seat_3: nil, price_3: nil, first_name_4: nil, last_name_4: nil, document_4: nil, seat_4: nil, price_4: nil, status: "Anulowana", country_1: "Polska", country_2: nil, country_3: nil, country_4: nil)
    mail = BookingMailer.booking_notification(@test_booking)
    assert_equal "Rezerwacja we FlightsApp", mail.subject
    assert_equal ["kupiszewskiadrian@gmail.com"], mail.to
    assert_equal ["office.flightsapp@gmail.com"], mail.from
    assert_emails 1 do
      mail.deliver_now
    end
  end
end
