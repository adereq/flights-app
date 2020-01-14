class RemoveImageFromAirports < ActiveRecord::Migration[5.2]
  def change
    remove_column :airports, :image, :text
  end
end
