class TransfersController < ApplicationController
  before_action :authenticate_user!
  def new
  	@transfer = Transfer.new
  end

  def show
  end

  def index
    @transfers = Transfer.where(user_id: current_user.id)
  end

  def create
    @transfer = Transfer.new(transfer_params)
    @transfer.title = "Doladowanie_#{current_user.email}_#{Time.now.strftime("%Y%m%d%H%M%S")}"
    puts @transfer.title
    respond_to do |format|
      if @transfer.save
        puts @request
        @request = Transfer.build_request_to_payment_provider(current_user.email, @transfer.amount, @transfer.title)
        #current_balance = User.find(@transfer.user_id).balance
        #puts current_balance
        #new_balance = current_balance + @transfer.amount
        #puts new_balance
        #User.find(@transfer.user_id).update(balance: new_balance)
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