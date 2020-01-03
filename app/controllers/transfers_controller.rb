class TransfersController < ApplicationController
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
    respond_to do |format|
      if @transfer.save
        current_balance = User.find(@transfer.user_id).balance
        puts current_balance
        new_balance = current_balance + @transfer.amount
        puts new_balance
        User.find(@transfer.user_id).update(balance: new_balance)
        format.html { redirect_to @transfer, notice: 'Transfer was successfully created.' }
        format.json { render :show, status: :ok, location: @transfer }        
      else
        format.html { render :new }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }        
      end
    end
  end

  private
  	def set_transfer
  	  @transfer = Transfer.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
    end

  	def transfer_params
      params.require(:transfer).permit(:amount, :user_id, :kind, :title)

    end  	

end