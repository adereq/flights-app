class RenameDestinationAirportIdToArrivalAirportId < ActiveRecord::Migration[5.2]
  def change
  	rename_column :flights, :destination_airport_id, :arrival_airport_id
  end
end
