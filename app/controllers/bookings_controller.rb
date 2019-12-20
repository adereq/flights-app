class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]

  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def new
  	@booking = Booking.new
  end

  def create
  	@booking = Booking.new(booking_params)
    @booking.pnr = Booking.pnr_generator
    puts @booking.pnr
  	respond_to do |format| 
  	  if @booking.save
        if @booking.booking_class == "economy"
          Flight.seat_economy_decrease(@booking.flight_id, @booking.passengers)          
  	  	  format.html {redirect_to @booking, notice: 'Flight was succesfully created'}
        elsif @booking.booking_class == "business"
          Flight.seat_business_decrease(@booking.flight_id, @booking.passengers)
          format.html {redirect_to @booking, notice: 'Flight was succesfully created'}
        else
          format.html {redirect_to :root}
        end
  	  else
  	  	format.html {redirect_to :root}
  	  end
  	end
  end

  def show
  end

  private

  def set_booking
  	@booking = Booking.find(params[:id])
  end

  def booking_params
  	params.require(:booking).permit(:pnr, :user_id, :total_price, :departure_airport, :arrival_airport, :flight_id, :passenger_id,
      :departure_date, :departure_time, :arrival_time, :flight_number, :lead_guest_first_name, :lead_guest_last_name,
      :booking_class, :mail, :passengers)
  end
end
