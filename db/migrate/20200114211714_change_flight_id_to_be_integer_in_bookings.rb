class ChangeFlightIdToBeIntegerInBookings < ActiveRecord::Migration[5.2]
  def change
  	change_column :bookings, :flight_id, 'integer USING CAST(flight_id AS integer)'
  end
end
