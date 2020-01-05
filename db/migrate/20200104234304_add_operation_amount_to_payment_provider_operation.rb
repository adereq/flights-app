class AddOperationAmountToPaymentProviderOperation < ActiveRecord::Migration[5.2]
  def change
    add_column :payment_provider_operations, :operation_amount, :decimal
  end
end
