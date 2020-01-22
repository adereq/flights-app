class AddPaymentProviderOperationIdToTransfers < ActiveRecord::Migration[5.2]
  def change
    add_column :transfers, :payment_provider_operation_id, :integer
  end
end
