class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  belongs_to :airplane
  has_many :ticket
  validates :departure_airport_id, :arrival_airport_id, :departure_date, :departure_time, :arrival_time, presence: true 


  def self.search_flights(params)
    Flight.where(departure_airport_id: params[:departure_airport_id],
                 arrival_airport_id: params[:arrival_airport_id],
                 departure_date: params[:departure_date]).where('economy_free_seats >=? OR business_free_seats >=?', params[:passengers], params[:passengers])
  end

  def self.select_flight(params)
    Flight.find(params[:flight_id])
  end

  def time_formatter(time)
  	time.strftime("%H:%M")
  end

  def self.seat_economy_decrease(flight_id, tickets)
    flight = Flight.find(flight_id)
    decreased_free_seats = flight.economy_free_seats - tickets
    flight.update(economy_free_seats: decreased_free_seats)
  end

  def self.seat_economy_increase(flight_id, tickets)
    flight = Flight.find(flight_id)
    increased_free_seats = flight.economy_free_seats + tickets
    flight.update(economy_free_seats: increased_free_seats)
  end

  def self.seat_business_decrease(flight_id,tickets)
    flight = Flight.find(flight_id)
    decreased_free_seats = flight.business_free_seats - tickets
    flight.update(business_free_seats: decreased_free_seats)
  end

  def self.seat_business_increase(flight_id,tickets)
    flight = Flight.find(flight_id)
    increased_free_seats = flight.business_free_seats + tickets
    flight.update(business_free_seats: increased_free_seats)
  end


end