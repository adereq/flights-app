class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :tickets_list]
  
  def index
    @tickets = Ticket.where(user_id: current_user.id)
  end

  def tickets_list
    @results = Ticket.search_tickets(params)
    if @results == []
      render :notickets
    end
  end

  def new
  	@ticket = Ticket.new
  end

  def create
  	@ticket = Ticket.new(ticket_params)
  	respond_to do |format|
  	  if @ticket.save
  	  	format.html {redirect_to @ticket, notice: 'Flight was succesfully created'}
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
      :departure_date, :departure_time, :arrival_time, :flight_number, :seat, :price, :mail)
  end

end
