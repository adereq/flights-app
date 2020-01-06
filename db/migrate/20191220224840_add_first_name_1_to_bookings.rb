class AddFirstName1ToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :first_name_1, :string
    add_column :bookings, :last_name_1, :string
    add_column :bookings, :document_1, :string
    add_column :bookings, :seat_1, :integer
    add_column :bookings, :price_1, :decimal
    add_column :bookings, :first_name_2, :string
    add_column :bookings, :last_name_2, :string
    add_column :bookings, :document_2, :string
    add_column :bookings, :seat_2, :integer
    add_column :bookings, :price_2, :decimal
    add_column :bookings, :first_name_3, :string
    add_column :bookings, :last_name_3, :string
    add_column :bookings, :document_3, :string
    add_column :bookings, :seat_3, :integer
    add_column :bookings, :price_3, :decimal
    add_column :bookings, :first_name_4, :string
    add_column :bookings, :last_name_4, :string
    add_column :bookings, :document_4, :string
    add_column :bookings, :seat_4, :integer
    add_column :bookings, :price_4, :decimal
    remove_column :bookings, :lead_guest_first_name, :string
    remove_column :bookings, :lead_guest_last_name, :string
  end
end
