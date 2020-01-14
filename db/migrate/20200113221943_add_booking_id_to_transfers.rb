class AddBookingIdToTransfers < ActiveRecord::Migration[5.2]
  def change
    add_column :transfers, :booking_id, :integer
  end
end
