class RemovePnrFromTicket < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :pnr, :string
    remove_column :tickets, :departure_airport_name, :string
    remove_column :tickets, :arrival_airport_name, :string
    remove_column :tickets, :departure_date, :date
    remove_column :tickets, :departure_time, :time
    remove_column :tickets, :arrival_time, :time
    remove_column :tickets, :flight_number, :string
  end
end
