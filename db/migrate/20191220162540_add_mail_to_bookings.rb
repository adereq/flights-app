class AddMailToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :mail, :string
  end
end
