class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :flight

  after_create :notify_client

  def notify_client
  	BookingMailer.booking_notification(self).deliver
  end

end
