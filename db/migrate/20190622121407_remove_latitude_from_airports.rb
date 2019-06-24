class RemoveLatitudeFromAirports < ActiveRecord::Migration[5.2]
  def change
    remove_column :airports, :latitude, :string
  end
end
