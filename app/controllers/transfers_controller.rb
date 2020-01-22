class TransfersController < ApplicationController
  before_action :authenticate_user!
  layout "booking", only: [:user_transfers, :new]

  def new
  	@transfer = Transfer.new
  end

  def show
  end

  def user_transfers
    @q = Transfer.where(user_id: current_user.id).ransack(params[:q])
    @transfers = @q.result.page(params[:page]).per(10)
  end

  def index
    @q = Transfer.all.ransack(params[:q])
    @transfers = @q.result.page(params[:page]).per(10)
  end

  def create
    @transfer = Transfer.new(transfer_params)
    @transfer.title = "Doladowanie_#{current_user.email}_#{Time.now.strftime("%Y%m%d%H%M%S")}"
    respond_to do |format|
      if @transfer.save
        puts @request
        @request = Transfer.build_request_to_payment_provider(current_user.email, @transfer.amount, @transfer.title)
        format.html { redirect_to @request, notice: 'Transfer was successfully created.', target: :_blank }
      else
        format.html { render :new }      
      end
    end
  end

  private
  	def set_transfer
  	  @transfer = Transfer.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
    end

  	def transfer_params
      params.require(:transfer).permit(:amount, :user_id, :kind, :title, :confirmed)

    end  	

end