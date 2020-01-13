class PaymentProviderOperationsController < ApplicationController
 skip_before_action :verify_authenticity_token

  def build_request

  end

  def new
  	@payment_provider_operation = PaymentProviderOperation.new
  end

  def create
  	@payment_provider_operation = PaymentProviderOperation.new(payment_provider_operation_params)
  	  if @payment_provider_operation.save
        related_transfer = Transfer.where(title: @payment_provider_operation.description).take
        related_transfer.update(confirmed: true, payment_provider_operation_id: @payment_provider_operation.id)
        original_balance = User.find(related_transfer.user_id).balance
        new_balance = original_balance + @payment_provider_operation.operation_amount
        User.find(related_transfer.user_id).update(balance: new_balance)
        render plain: "OK"
  	  else
  	  	render plain: "BAD" 
  	  end
  end

  private

  def payment_provider_operation_params
  	params.permit(:operation_number, :operation_amount, :description, :operation_status, :email, :signature)
  end
end