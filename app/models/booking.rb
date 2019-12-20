class Booking < ApplicationRecord
  has_many :ticket
  belongs_to :user
  after_create :notify_client

  def notify_client
  	BookingMailer.booking_notification(self).deliver
  end

  def self.pnr_generator
    (Time.now.to_f*1000).to_i.to_s(36).upcase
  end
end
