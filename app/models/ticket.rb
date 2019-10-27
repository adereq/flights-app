class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :flight

  after_create :notify_client

  def notify_client
  	BookingMailer.booking_notification(self).deliver
  end

  def self.search_tickets(params)
    Ticket.where(flight_id: params[:flight_id])
  end

end
