class Airport < ApplicationRecord
  has_many :departing_flights, class_name: 'Flight', foreign_key: :departure_airport_id
  has_many :arriving_flights, class_name: 'Flight', foreign_key: :destination_airport_id

  validates :city, :country, :name, presence: true
  validates :iata, length: {is: 3}, presence: true

  scope :poland, -> {where(country: "Polska")}
  
  #def self.airport_poland
  #	Airport.where(:country => 'Polska')
  #end
end