class AddConfirmedToTransfers < ActiveRecord::Migration[5.2]
  def change
    add_column :transfers, :confirmed, :boolean
  end
end
