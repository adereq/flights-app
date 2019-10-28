class CreateAirplanes < ActiveRecord::Migration[5.2]
  def change
    create_table :airplanes do |t|
      t.string :model
      t.integer :economy_seats
      t.integer :business_seats

      t.timestamps
    end
  end
end
