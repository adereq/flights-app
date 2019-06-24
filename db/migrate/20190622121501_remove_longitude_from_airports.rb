class RemoveLongitudeFromAirports < ActiveRecord::Migration[5.2]
  def change
    remove_column :airports, :longitude, :string
  end
end
