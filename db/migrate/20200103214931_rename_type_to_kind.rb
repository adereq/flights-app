class RenameTypeToKind < ActiveRecord::Migration[5.2]
  def change
  	rename_column :transfers, :type, :kind
  end
end