class AddBookingIdToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :booking_id, :integer
  end
end
