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

  	respond_to do |format| 
  	  if @booking.save
        if @booking.booking_class == "economy"
          Flight.seat_economy_decrease(@booking.flight_id, @booking.passengers)
          for i in 1..@booking.passengers 
            if i == 1
              @ticket = Ticket.new(booking_id: @booking.id, flight_id: @booking.flight_id, user_id: @booking.user_id, first_name: @booking.first_name_1,
                last_name: @booking.last_name_1, pnr: @booking.pnr, price: @booking.price_1, seat_class: "economy")
              @ticket.save
              elsif i == 2
              @ticket = Ticket.new(booking_id: @booking.id, flight_id: @booking.flight_id, user_id: @booking.user_id, first_name: @booking.first_name_2,
                last_name: @booking.last_name_2, pnr: @booking.pnr, price: @booking.price_2, seat_class: "economy")
              @ticket.save
              elsif i == 3
              @ticket = Ticket.new(booking_id: @booking.id, flight_id: @booking.flight_id, user_id: @booking.user_id, first_name: @booking.first_name_3,
                last_name: @booking.last_name_3, pnr: @booking.pnr, price: @booking.price_3, seat_class: "economy")
              @ticket.save    
              elsif i == 4
              @ticket = Ticket.new(booking_id: @booking.id, flight_id: @booking.flight_id, user_id: @booking.user_id, first_name: @booking.first_name_4,
                last_name: @booking.last_name_4, pnr: @booking.pnr, price: @booking.price_4, seat_class: "economy")
              @ticket.save  
            end           
          end
          format.html {redirect_to @booking, notice: 'Flight was succesfully created'}
        elsif @booking.booking_class == "business"
          Flight.seat_business_decrease(@booking.flight_id, @booking.passengers)
          for i in 1..@booking.passengers 
            if i == 1
              @ticket = Ticket.new(booking_id: @booking.id, flight_id: @booking.flight_id, user_id: @booking.user_id, first_name: @booking.first_name_1,
                last_name: @booking.last_name_1, pnr: @booking.pnr, price: @booking.price_1, seat_class: "business")
              @ticket.save
              elsif i == 2
              @ticket = Ticket.new(booking_id: @booking.id, flight_id: @booking.flight_id, user_id: @booking.user_id, first_name: @booking.first_name_2,
                last_name: @booking.last_name_2, pnr: @booking.pnr, price: @booking.price_2, seat_class: "business")
              @ticket.save
              elsif i == 3
              @ticket = Ticket.new(booking_id: @booking.id, flight_id: @booking.flight_id, user_id: @booking.user_id, first_name: @booking.first_name_3,
                last_name: @booking.last_name_3, pnr: @booking.pnr, price: @booking.price_3, seat_class: "business")
              @ticket.save    
              elsif i == 4
              @ticket = Ticket.new(booking_id: @booking.id, flight_id: @booking.flight_id, user_id: @booking.user_id, first_name: @booking.first_name_4,
                last_name: @booking.last_name_4, pnr: @booking.pnr, price: @booking.price_4, seat_class: "economy")
              @ticket.save  
            end           
          end
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
      :departure_date, :departure_time, :arrival_time, :flight_number, :first_name_1, :last_name_1, :first_name_2, :last_name_2, 
      :first_name_3, :last_name_3, :first_name_4,:last_name_4, :price_1, :price_2, :price_3, :price_4,:booking_class, :mail, :passengers)
  end
end
