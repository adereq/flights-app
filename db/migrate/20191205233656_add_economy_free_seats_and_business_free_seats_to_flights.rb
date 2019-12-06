class AddEconomyFreeSeatsAndBusinessFreeSeatsToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :economy_free_seats, :integer
    add_column :flights, :business_free_seats, :integer
  end
end
