class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.integer :departure_airport_id
      t.integer :destination_airport_id
      t.date :departure_date
      t.time :departure_time
      t.time :arrival_time
      t.string :flight_number
      t.integer :seats
      t.float :price

      t.timestamps
    end
  end
end
