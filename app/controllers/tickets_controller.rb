class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show]
  layout "admin", only: [:tickets_list]
  layout "booking", only: [:index]

  def index
    @q = Ticket.where(user_id: current_user.id).ransack(params[:q])
    @tickets = @q.result.page(params[:page]).per(10)
  end

  def tickets_list
    @ticket = Ticket.search_tickets(params[:id]).page(params[:page]).per(10)
    @total_income = 0
    @ticket.each do |ticket|
      @total_income+= ticket.price
    end
    if @ticket == []
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
      :departure_date, :departure_time, :arrival_time, :flight_number, :seat, :price, :mail, :seat_class)
  end
end
