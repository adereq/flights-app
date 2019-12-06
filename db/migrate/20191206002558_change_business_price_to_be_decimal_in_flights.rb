class ChangeBusinessPriceToBeDecimalInFlights < ActiveRecord::Migration[5.2]
  def change
  	change_column :flights, :business_price, :decimal
  end
end
