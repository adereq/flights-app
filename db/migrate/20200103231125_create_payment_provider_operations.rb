class CreatePaymentProviderOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_provider_operations do |t|
      t.string :operation_number
      t.string :opeartions_status
      t.decimal :operation_amount
      t.string :operation_amount
      t.string :email
      t.string :signature
      t.timestamps
    end
  end
end
