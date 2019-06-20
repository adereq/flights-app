class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  validates :departure_airport_id, :arrival_airport_id, presence: true 

  def self.search_flights(departure_airport_id, arrival_airport_id)
    Flight.where(departure_airport_id: departure_airport_id,
                 arrival_airport_id: arrival_airport_id)
  end
end