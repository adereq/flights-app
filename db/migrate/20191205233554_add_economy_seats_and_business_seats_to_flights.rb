class AddEconomySeatsAndBusinessSeatsToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :economy_seats, :integer
    add_column :flights, :business_seats, :integer
  end
end
