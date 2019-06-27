class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.booking_notification.subject
  #
  def booking_notification(ticket)
    @ticket = ticket

    mail to: "#{@ticket.mail}", subject: "Rezerwacja we FlightsApp", from: 'FlightApp Office <office.flightsapp@gmail.com>'
  end
end
