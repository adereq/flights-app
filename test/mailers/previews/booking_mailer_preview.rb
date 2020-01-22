# Preview all emails at http://localhost:3000/rails/mailers/booking_mailer
class BookingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/booking_mailer/booking_notification
  def booking_notification
    BookingMailer.booking_notification(Booking.new(total_price: 200, passengers:2, flight_id: 40 ))
  end

end
