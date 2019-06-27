# Preview all emails at http://localhost:3000/rails/mailers/booking_mailer
class BookingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/booking_mailer/booking_notification
  def booking_notification
    BookingMailer.booking_notification(Ticket.new(flight_number: "A87",departure_airport_name: "Wrocław" ))
  end

end
