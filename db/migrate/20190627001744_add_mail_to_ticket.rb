class AddMailToTicket < ActiveRecord::Migration[5.2]
  def change
  	add_column :tickets, :mail, :string
  end
end
