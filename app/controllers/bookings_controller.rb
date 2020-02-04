class BookingsController < ApplicationController
  layout "booking", only: [:user_bookings, :booking_confirmation, :get_user_booking_details, :booking_failed]
  before_action :set_booking, only: [:cancel_booking, :show, :destroy, :booking_confirmation, :get_user_booking_details]

  before_action :authenticate_user!, only: [:camcel_booking, :index, :show, :edit, :destroy, :booking_confirmation, :user_bookings,:get_user_booking_details_path]
  before_action :bookings_authorization, only: [:index, :destroy]

  def bookings_authorization
    if current_user.superadmin_role || current_user.airline_manager_role || current_user.airport_manager_role
    else
      authorization_error
    end
  end

  def booking_confirmation
  end

  def index
    @q = Booking.ransack(params[:q])
    @bookings = @q.result.page(params[:page]).per(10)
  end

  def user_bookings
    @q = Booking.where(user_id: current_user.id).ransack(params[:q])
    @bookings = @q.result.page(params[:page]).per(10)
  end

  def get_user_booking_details
  end

  def new
  	@booking = Booking.new
  end

  def booking_failed
  end

  def cancel_booking
    respond_to do |format|
      if @booking.update(status:"Anulowana")
        @new_balance = current_user.balance + @booking.total_price
        User.find(current_user.id).update(balance: @new_balance)
        if @booking.booking_class == "economy"
          @new_economy_free_seats = @booking.flight.economy_free_seats + @booking.passengers
          Flight.find(@booking.flight.id).update(economy_free_seats: @new_economy_free_seats)
          Transfer.create(booking_id: @booking.id, user_id: current_user.id, amount: @booking.total_price, kind: "Anulowanie rezerwacji", title: "Anulowanie rezerwacji_#{@booking.pnr}", confirmed: true)
        elsif @booking.booking_class == "business"
          @new_business_free_seats = @booking.flight.business_free_seats + @booking.passengers
          Flight.find(@booking.flight.id).update(business_free_seats: @new_business_free_seats)
          Transfer.create(booking_id: @booking.id, user_id: current_user.id, amount: @booking.total_price, kind: "Anulowanie rezerwacji", title: "Anulowanie rezerwacji_#{@booking.pnr}", confirmed: true)
        end
            
        format.html {redirect_to user_bookings_path, notice: 'Rezerwacja została anulowana'}
      else
        format.html {redirect_to user_bookings_path, notice: "Błąd podczas anulacji" }
      end
    end
  end

  def create
  	@booking = Booking.new(booking_params)
    @booking.pnr = Booking.pnr_generator
  	respond_to do |format| 
      if @booking.total_price <= current_user.balance && Flight.check_free_seats(@booking.flight_id, @booking.passengers, @booking.booking_class)
       if @booking.save
          @new_balance = current_user.balance - @booking.total_price
          puts current_user.balance
          puts @new_balance
          User.find(current_user.id).update(balance: @new_balance)
          Transfer.create(booking_id: @booking.id, user_id: current_user.id, amount: @booking.total_price, kind: "Zakup biletu", title: "Bilet_#{@booking.pnr}", confirmed: true)
          if @booking.booking_class == "economy"
          Flight.seat_economy_decrease(@booking.flight_id, @booking.passengers)
          for i in 1..@booking.passengers 
            if i == 1
              @ticket = Ticket.new(booking_id: @booking.id, flight_id: @booking.flight_id, user_id: @booking.user_id, first_name: @booking.first_name_1, last_name: @booking.last_name_1, seat: @booking.seat_1, document_id: @booking.document_1, country: @booking.country_1, price: @booking.price_1, seat_class: "economy")
              @ticket.save
              elsif i == 2
              @ticket = Ticket.new(booking_id: @booking.id, flight_id: @booking.flight_id, user_id: @booking.user_id, first_name: @booking.first_name_2, last_name: @booking.last_name_2, seat: @booking.seat_2, document_id: @booking.document_2, country: @booking.country_2, price: @booking.price_2, seat_class: "economy")
              @ticket.save
              elsif i == 3
              @ticket = Ticket.new(booking_id: @booking.id, flight_id: @booking.flight_id, user_id: @booking.user_id, first_name: @booking.first_name_3, last_name: @booking.last_name_3, seat: @booking.seat_3, document_id: @booking.document_3, country: @booking.country_3, price: @booking.price_3, seat_class: "economy")
              @ticket.save    
              elsif i == 4
              @ticket = Ticket.new(booking_id: @booking.id, flight_id: @booking.flight_id, user_id: @booking.user_id, first_name: @booking.first_name_4, last_name: @booking.last_name_4, seat: @booking.seat_4, document_id: @booking.document_4, country: @booking.country_4, price: @booking.price_4, seat_class: "economy")
              @ticket.save  
            end           
          end
          format.html {redirect_to booking_confirmation_path(@booking), notice: 'Lot został zarezerwowany'}
        elsif @booking.booking_class == "business"
          Flight.seat_business_decrease(@booking.flight_id, @booking.passengers)
          for i in 1..@booking.passengers 
            if i == 1
              @ticket = Ticket.new(booking_id: @booking.id, flight_id: @booking.flight_id, user_id: @booking.user_id, first_name: @booking.first_name_1, last_name: @booking.last_name_1, seat: @booking.seat_1, document_id: @booking.document_1, country: @booking.country_1, price: @booking.price_1, seat_class: "business")
              @ticket.save
              elsif i == 2
              @ticket = Ticket.new(booking_id: @booking.id, flight_id: @booking.flight_id, user_id: @booking.user_id, first_name: @booking.first_name_2, last_name: @booking.last_name_2, seat: @booking.seat_2, document_id: @booking.document_2, country: @booking.country_2, price: @booking.price_2, seat_class: "business")
              @ticket.save
              elsif i == 3
              @ticket = Ticket.new(booking_id: @booking.id, flight_id: @booking.flight_id, user_id: @booking.user_id, first_name: @booking.first_name_3, last_name: @booking.last_name_3, seat: @booking.seat_3, document_id: @booking.document_3, country: @booking.country_3, price: @booking.price_3, seat_class: "business")
              @ticket.save    
              elsif i == 4
              @ticket = Ticket.new(booking_id: @booking.id, flight_id: @booking.flight_id, user_id: @booking.user_id, first_name: @booking.first_name_4, last_name: @booking.last_name_4, seat: @booking.seat_1, document_id: @booking.document_4, country: @booking.country_4, price: @booking.price_4, seat_class: "business")
              @ticket.save  
            end           
          end
          format.html {redirect_to booking_confirmation_path(@booking), notice: 'Lot został zarezerwowany'}
        else
          format.html {redirect_to :root}
        end
  	    else
  	  	format.html {redirect_to :root}
  	    end
      elsif @booking.total_price > current_user.balance
        format.html {redirect_to request.referer, notice: 'Za mało środków na koncie.'}
      else
        format.html {redirect_to request.referer, notice: 'Lot niedostępny.'}
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
  	params.require(:booking).permit(:pnr, :user_id, :flight_id, :total_price, :first_name_1, :last_name_1, :first_name_2, :last_name_2, :first_name_3, :last_name_3, :first_name_4,:last_name_4, :price_1, :price_2, :price_3, :price_4, :seat_1, :seat_2, :seat_3, :seat_4, :document_1, :document_2, :document_3, :document_4, :country_1, :country_2, :country_3, :country_4, :status, :booking_class, :mail, :passengers)
  end
end
