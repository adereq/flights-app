class FlightsController < ApplicationController
  before_action :authenticate_user!, only: [:selected_flight, :selected_economy_flight, :selected_business_flight, :index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_flight, only: [:show, :edit, :update, :destroy, :selected_flight]
  layout "booking", only: [:selected_business_flight, :selected_economy_flight, :availability, :search]
  before_action :flights_authorization, only: [:index, :destroy]

  def flights_authorization
    if current_user.superadmin_role || current_user.airline_manager_role
    else
      authorization_error
    end
  end

  def find_departure_flights_for_airport_manager
    @airport_id = current_user.airport_id
    @departure_flights = Flight.joins(:departure_airport).where(airports: {id: @airport_id})
  end

  def find_arrival_flights_for_airport_manager
    @airport_id = current_user.airport_id
    @arrival_flights = Flight.joins(:arrival_airport).where(airports: {id: @airport_id})
  end

  def availability
      @results = Flight.search_flights(params)
    if @results == []
      render :noflights
    end
  end

  def search
    @airports_list = Airport.all.map{ |u| [u.name, u.id] }
    render layout: 'start_page'
  end

  def index
    @q = Flight.ransack(params[:q])
    @flights = @q.result.page(params[:page]).per(10)
  end

  def show
  end

  def selected_economy_flight
    @selected_flight = Flight.select_flight(params)
  end

  def selected_business_flight
    @selected_flight = Flight.select_flight(params)
  end

  def new
  	@flight = Flight.new
  end

  def create 
  	@flight = Flight.new(flight_params)
    @economy_seats = Airplane.find(@flight.airplane_id).economy_seats
    @flight.economy_seats = @economy_seats
    @flight.economy_free_seats = @economy_seats
    @business_seats = Airplane.find(@flight.airplane_id).business_seats
    @flight.business_seats = @business_seats
    @flight.business_free_seats = @business_seats
  	respond_to do |format|
  	  if @flight.save
  	  	format.html {redirect_to @flight, notice: 'Lot został dodany pomyślnie'}
  	  else
  	  	format.html {render :new, notice: "Błąd podczas dodawania lotu"}
  	  end
  	end
  end

  def edit
  end

  def update
  	respond_to do |format|
  	  if @flight.update(flight_params)
  	  	format.html {redirect_to @flight, notice: 'Lot został zaktualizowany'}
  	  else
  	  	format.html {render :new, notice: "Błąd podczas aktualizowania lotu" }
  	  end
  	end
  end

  def destroy
  	@flight.destroy
  	respond_to do |format|
      format.html { redirect_to flights_path, notice: 'Lot został został usuniety' }
  	end
  end

private
  	def set_flight
  	  @flight = Flight.find(params[:id])
  	end

  	def flight_params
  	  params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :departure_date, :departure_time,:arrival_time, :flight_number, :economy_seats, :business_seats, :economy_free_seats, :business_free_seats, :economy_price, :business_price, :price, :airplane_id)
  	end

  	def airport_validator
  	  if params[:departure_airport_id] == params[:arrival_airport_id]
      end
  	end

end
