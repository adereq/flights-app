class PaymentProviderOperationsController < ApplicationController
 skip_before_action :verify_authenticity_token

  def build_request

  end

  def new
  	@payment_provider_operation = PaymentProviderOperation.new
  end

  def create
  	@payment_provider_operation = PaymentProviderOperation.new(payment_provider_operation_params)
  	respond_to do |format| 
  	  if @payment_provider_operation.save
        Transfer.where(title: @payment_provider_operation.description).take.update(confirmed: true)
        format.json { render json: {message: "payment_received"}, status: :ok } 
  	  else
  	  	format.json { render json: {message: "payment_not_received"}, status: :ok } 
  	  end
  	end
  end

  private

  def payment_provider_operation_params
  	params.permit(:operation_number, :operation_amount, :description)
  end
end