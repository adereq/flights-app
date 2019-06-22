class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  validates :departure_airport_id, :arrival_airport_id, :departure_date, :departure_time, :arrival_time, presence: true 


  def self.search_flights(params)
    Flight.where(departure_airport_id: params[:departure_airport_id],
                 arrival_airport_id: params[:arrival_airport_id],
                 departure_date: params[:departure_date])
  end

  def time_formatter(time)
  	time.strftime("%H:%M")
  end

end