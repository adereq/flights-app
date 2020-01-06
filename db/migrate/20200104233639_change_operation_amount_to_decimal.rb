class ChangeOperationAmountToDecimal < ActiveRecord::Migration[5.2]
  def change
    remove_column :payment_provider_operations, :operation_amount, :string
  end
end