class BookingMailer < ApplicationMailer

  def booking_notification(ticket)
    @ticket = ticket

    mail to: "#{@ticket.mail}", subject: "Rezerwacja we FlightsApp", from: 'FlightApp Office <office.flightsapp@gmail.com>'
  	puts "booking_notification"
  end
end
