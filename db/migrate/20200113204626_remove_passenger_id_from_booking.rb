class RemovePassengerIdFromBooking < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :passenger_id, :string
    remove_column :bookings, :departure_airport, :string
    remove_column :bookings, :arrival_airport, :string
    remove_column :bookings, :departure_date, :date
    remove_column :bookings, :departure_time, :time
    remove_column :bookings, :arrival_time, :time
    remove_column :bookings, :flight_number, :string
    add_column :bookings, :status, :string
    add_column :bookings, :country_1, :string
    add_column :bookings, :country_2, :string
    add_column :bookings, :country_3, :string
    add_column :bookings, :country_4, :string 
  end
end