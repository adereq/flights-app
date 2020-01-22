Rails.application.routes.draw do

  devise_for :users
  root to: 'flights#search'

  get 'booking_confirmation/:id', to: 'bookings#booking_confirmation', as: 'booking_confirmation'
  get 'get_user_booking_details/:id', to: 'bookings#get_user_booking_details', as: 'get_user_booking_details'
  get 'cancel_booking/:id', to: 'bookings#cancel_booking', as: 'cancel_booking'
  get 'bookings/booking_failed', to: "bookings#booking_failed", as: 'booking_failed'
  

  get 'search', to: 'flights#search'
  get 'availability', to: 'flights#availability'  
  get 'user_transfers', to: 'transfers#user_transfers', as: 'user_transfers'
  get 'user_bookings', to: 'bookings#user_bookings', as: 'user_bookings'
  get 'user_charge', to: "transfers#new", as: 'user_charge'
  get 'admin/flight_tickets_list/:id', to: 'tickets#flight_tickets_list', as: 'flight_tickets_list'
  get 'selected_economy_flight', to: 'flights#selected_economy_flight', as: 'selected_economy_flight'
  get 'selected_business_flight', to: 'flights#selected_business_flight', as: 'selected_business_flight'
  get 'admin/flights/departure_flights', to: "flights#find_departure_flights_for_airport_manager", as: "departure_flights"
  get 'admin/flights/arrival_flights', to: "flights#find_arrival_flights_for_airport_manager", as: "arrival_flights"
  get 'api/v1/flights_availability', to:"flights#flights_availability", as:"flights_availability"

  resources :payment_provider_operations, defaults: { format: 'plain' }
  get 'admin/payment_provider_operations', to: 'payment_provider_operations#index', as: "payment_provider_operation_list"
  get 'admin', to: 'pages#home', as: 'admin'
  get 'airports/get_airport/:id', to: 'airports#get_airport'
  
  scope '/admin' do
    resources :flights, :airports, :airplanes, :users, :bookings, :tickets, :transfers
  end
  
  match 'bookings', to: 'bookings#create', via: [:post]

  match '*unmatched', to: 'application#route_not_found', via: :all

end
