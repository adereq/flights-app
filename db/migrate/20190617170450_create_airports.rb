class CreateAirports < ActiveRecord::Migration[5.2]
  def change
    create_table :airports do |t|
      t.string :city
      t.string :country
      t.string :name
      t.string :iata
      t.string :latitude
      t.string :longitude
      t.string :timezone
      t.text :image

      t.timestamps
    end
  end
end
