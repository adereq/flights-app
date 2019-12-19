class AddClassToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :class, :string
  end
end
