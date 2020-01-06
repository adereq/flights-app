class RemoveClassFromTickets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :class, :string
  end
end
