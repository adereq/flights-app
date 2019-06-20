class FlightsController < ApplicationController
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  
  def index
    @flights = Flight.all
  end

  def show
  end

  def new
  	@flight = Flight.new
  end

  def create 
  	@flight = Flight.new(flight_params)

  	respond_to do |format|
  	  if @flight.save
  	  	format.html {redirect_to @airport, notice: 'Airport was succesfully created'}
  	    format.html {redirect_to @airport, notice: 'Airport was succesfully created'}
  	  else
  	  	format.html {render :new}
  	  	format.json {render json: @airport.errors, status: :unprocessable_entity }
  	  end
  	end
  end

  def edit
  end

  def update
  	respond_to do |format|
  	  if @flight.save
  	  	format.html {redirect_to @airport, notice: 'Airport was succesfully created'}
  	    format.html {redirect_to @airport, notice: 'Airport was succesfully created'}
  	  else
  	  	format.html {render :new}
  	  	format.json {render json: @airport.errors, status: :unprocessable_entity }
  	  end
  	end
  end

  	def destroy
  	  @airport.destroy
  	  respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Airpot was successfully destroyed.' }
      format.json {head :no_content}
  	  end
  	end

private
  	def set_flight
  	  @flight = Flight.find(params[:id])
  	end

  	def flight_params
  	  params.require(:flight).permit(:departure_airport_id, :arrival_aiport_id, :departure_date, :departure_time,:arrival_time, :flight_number, :seats, :price)
  	end
end
