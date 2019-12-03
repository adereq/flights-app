class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  belongs_to :airplane
  has_many :ticket
  validates :departure_airport_id, :arrival_airport_id, :departure_date, :departure_time, :arrival_time, presence: true 


  def self.search_flights(params)
    Flight.where(departure_airport_id: params[:departure_airport_id],
                 arrival_airport_id: params[:arrival_airport_id],
                 departure_date: params[:departure_date]).where("free_seats >= ?", params[:free_seats])
  end

  def time_formatter(time)
  	time.strftime("%H:%M")
  end

  def self.seat_decrease(flight_id)
    flight = Flight.find(flight_id)
    decresed_free_seats = flight.free_seats - 1
    flight.update(free_seats: decresed_free_seats)
  end

end