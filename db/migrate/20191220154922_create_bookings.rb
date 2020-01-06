class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :pnr
      t.float :total_price
      t.string :departure_airport
      t.string :arrival_airport
      t.string :flight_id
      t.string :passenger_id
      t.date :departure_date
      t.time :departure_time
      t.time :arrival_time
      t.string :flight_number
      t.string :lead_guest_first_name
      t.string :lead_guest_last_name
      t.string :booking_class
    end
  end
end