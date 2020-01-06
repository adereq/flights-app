class AddSeatClassToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :seat_class, :string
  end
end
