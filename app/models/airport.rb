class Airport < ApplicationRecord
  has_many :departing_flights, class_name: "Flight", 
  foreign_key: "departure_airport_id"
  has_many :ariving_flights, class_name: "Flight", 
  foreign_key: "destination_airport_id"
end
