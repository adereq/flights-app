class FlightsController < ApplicationController
  before_action :authenticate_user!, only: [:selected_flight]
  before_action :set_flight, only: [:show, :edit, :update, :destroy, :selected_flight]
  layout "admin", only: [:index, :show, :new, :create, :edit, :update, :destroy]
  

  def availability
    @results = Flight.search_flights(params)
    if @results == []
      render :noflights
    end
  end

  def search
    @airports_list = Airport.all.map{ |u| [u.name, u.id] }
  end

  def index
    @flights = Flight.all
  end

  def show
  end

  def selected_flight
  end

  def new
  	@flight = Flight.new
  end

  def create 
  	@flight = Flight.new(flight_params)
    @seats = Airplane.find(@flight.airplane_id).economy_seats
    @flight.seats = @seats
    @flight.free_seats = @seats

  	#airport_validator
  	respond_to do |format|
  	  if @flight.save
  	  	format.html {redirect_to @flight, notice: 'Flight was succesfully created'}
  	  else
  	  	format.html {render :new}
  	  end
  	end
  end

  def edit
  end

  def update
  	respond_to do |format|
  	  if @flight.save
  	  	format.html {redirect_to @flight, notice: 'Flight was succesfully created'}
  	  else
  	  	format.html {render :new}
  	  end
  	end
  end

  	def destroy
  	  @flight.destroy
  	  respond_to do |format|
      format.html { redirect_to flights_path, notice: 'Flight was successfully destroyed.' }
      format.json {head :no_content}
  	  end
  	end

private
  	def set_flight
  	  @flight = Flight.find(params[:id])
  	end

  	def flight_params
  	  params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :departure_date, :departure_time,:arrival_time, :flight_number, :seats, :price, :airplane_id)
  	end

  	def airport_validator
  	  if params[:departure_airport_id] == params[:arrival_airport_id]
        puts "DUPA"
      end
  	end

end
