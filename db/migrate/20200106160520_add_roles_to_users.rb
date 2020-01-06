class AddRolesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :superadmin_role, :boolean, default: false
    add_column :users, :airline_manager_role, :boolean, default: false
    add_column :users, :client_role, :boolean, default: false
    add_column :users, :airport_manager_role, :boolean, default: false
    add_column :users, :airport_id, :integer
  end
end
