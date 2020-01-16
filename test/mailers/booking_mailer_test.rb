require 'test_helper'

class BookingMailerTest < ActionMailer::TestCase
=begin 
   test "booking_notification" do
    mail = BookingMailer.booking_notification(Ticket.new(first_name: "Adrian",
    	last_name: "Kupiszewski"))
    assert_equal "Booking notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end
=end
end
