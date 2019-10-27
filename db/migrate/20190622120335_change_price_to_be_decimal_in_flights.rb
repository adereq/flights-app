class ChangePriceToBeDecimalInFlights < ActiveRecord::Migration[5.2]
  def change
  	change_column :flights, :price, :decimal
  end
end
