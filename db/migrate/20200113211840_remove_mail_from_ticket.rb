class RemoveMailFromTicket < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :mail, :string
  end
end
