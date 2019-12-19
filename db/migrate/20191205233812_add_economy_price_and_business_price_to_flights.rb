class AddEconomyPriceAndBusinessPriceToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :economy_price, :integer
    add_column :flights, :business_price, :integer
  end
end
