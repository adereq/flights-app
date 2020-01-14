class BookingMailer < ApplicationMailer

  def booking_notification(booking)
    @booking = booking
    @departure_time = @booking.flight.departure_time.strftime("%H:%M")
    @arrival_time = @booking.flight.arrival_time.strftime("%H:%M")
    mail to: "#{@booking.mail}", subject: "Rezerwacja we FlightsApp", from: 'FlightApp Office <office.flightsapp@gmail.com>'
  	puts "booking_notification"
  end
end
