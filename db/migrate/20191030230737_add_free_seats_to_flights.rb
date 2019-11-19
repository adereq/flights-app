class AddFreeSeatsToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :free_seats, :integer
  end
end
