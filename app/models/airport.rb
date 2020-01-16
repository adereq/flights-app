class Airport < ApplicationRecord
  has_many :departing_flights, class_name: 'Flight', foreign_key: :departure_airport_id
  has_many :arriving_flights, class_name: 'Flight', foreign_key: :destination_airport_id
  has_many :users

  validates :city, :country, :name, presence: true
  validates :iata, length: {is: 3}, presence: true, uniqueness: true

  before_create :titelize_airport_name
  
  def titelize_airport_name
  	self.name = self.name.to_s.titleize
  end
end