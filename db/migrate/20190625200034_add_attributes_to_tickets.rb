class AddAttributesToTickets < ActiveRecord::Migration[5.2]
  def change
  	add_column :tickets, :flight_id, :integer
  	add_column :tickets, :passenger_id, :integer
  	add_column :tickets, :first_name, :string
  	add_column :tickets, :last_name, :string
  	add_column :tickets, :document_id, :string
  	add_column :tickets, :country, :string
  	add_column :tickets, :departure_airport_name, :string
  	add_column :tickets, :arrival_airport_name, :string
  	add_column :tickets, :departure_date, :date
  	add_column :tickets, :departure_time, :time
  	add_column :tickets, :arrival_time, :time
  	add_column :tickets, :flight_number, :string
  	add_column :tickets, :seat, :string
  	add_column :tickets, :price, :decimal	  	
  end
end
