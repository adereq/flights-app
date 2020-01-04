class AddDescriptionToPaymentProviderOperations < ActiveRecord::Migration[5.2]
  def change
    add_column :payment_provider_operations, :description, :string
    rename_column :payment_provider_operations, :opeartions_status, :operation_status
  end
end
