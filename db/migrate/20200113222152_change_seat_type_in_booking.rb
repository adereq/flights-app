class ChangeSeatTypeInBooking < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :seat_1, :string
    change_column :bookings, :seat_2, :string
    change_column :bookings, :seat_3, :string
    change_column :bookings, :seat_4, :string
  end
end
