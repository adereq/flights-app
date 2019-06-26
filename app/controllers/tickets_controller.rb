class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show]
  
  def new
  	@ticket = Ticket.new
  end

  def create
  	@ticket = Ticket.new(ticket_params)
  	respond_to do |format|
  	  if @ticket.save
  	  	format.html {redirect_to @ticket, notice: 'Flight was succesfully created'}
  	  else
  	  	format.html {render :new}
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
  	params.require(:ticket).permit(:first_name, :last_name, :document_id, :country)
  end

end