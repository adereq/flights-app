class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show]
  layout "admin"

  def index
    @q = Ticket.where(user_id: current_user.id).ransack(params[:q])
    @tickets = @q.result.page(params[:page]).per(10)
  end

  def flight_tickets_list
    @q = Flight.find(params[:id]).tickets.ransack(params[:q])
    @tickets = @q.result.page(params[:page]).per(10)
    @flight = Flight.find(params[:id])
    @total_income = Flight.find(params[:id]).tickets.sum(:price)
    @confimred_tickets = Flight.find(params[:id]).tickets
    @sold_economy_tickets = Flight.find(params[:id]).tickets.where(seat_class:"economy").count
    @sold_business_tickets = Flight.find(params[:id]).tickets.where(seat_class:"business").count
  end

  def new
  	@ticket = Ticket.new
  end

  def create
  	@ticket = Ticket.new(ticket_params)
  	respond_to do |format| 
  	  if @ticket.save
        format.html {redirect_to @ticket}
  	  else
  	  	format.html {redirect_to :root}
  	  end
  	end
  end

  def show
  end

  private

  def set_ticket
  	@ticket = Ticket.find(params[:id])
  end

  def ticket_params
  	params.require(:ticket).permit(:pnr, :flight_id, :user_id,
      :first_name, :last_name, :document_id, :country, :departure_airport_name, :arrival_airport_name, 
      :departure_date, :departure_time, :arrival_time, :flight_number, :seat, :price, :mail, :seat_class)
  end
end
