class RenamePassengerIdToUserId < ActiveRecord::Migration[5.2]
  def change
  	rename_column :tickets, :passenger_id, :user_id
  end
end
