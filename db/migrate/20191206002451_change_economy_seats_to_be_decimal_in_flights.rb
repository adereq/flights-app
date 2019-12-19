class ChangeEconomySeatsToBeDecimalInFlights < ActiveRecord::Migration[5.2]
  def change
  	change_column :flights, :economy_price, :decimal
  end
end
