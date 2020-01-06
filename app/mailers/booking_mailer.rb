class BookingMailer < ApplicationMailer

  def booking_notification(booking)
    @booking = booking

    mail to: "#{@booking.mail}", subject: "Rezerwacja we FlightsApp", from: 'FlightApp Office <office.flightsapp@gmail.com>'
  	puts "booking_notification"
  end
end
