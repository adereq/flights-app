class RemoveSeatsFromFlights < ActiveRecord::Migration[5.2]
  def change
    remove_column :flights, :seats, :integer
    remove_column :flights, :price, :decimal
  end
end
