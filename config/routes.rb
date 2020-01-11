Rails.application.routes.draw do

  get 'bookings/booking_confirmation', to: 'bookings#booking_confirmation', as: 'booking_confirmation'
  devise_for :users
  root to: 'flights#search'
  get 'search', to: 'flights#search'
  get 'availability', to: 'flights#availability'  
  get 'admin/tickets_list/:id', to: 'tickets#tickets_list', as: 'tickets_list'
  get 'selected_flight/:id', to: 'flights#selected_flight', as: 'selected_flight'
  get 'selected_economy_flight', to: 'flights#selected_economy_flight', as: 'selected_economy_flight'
  get 'selected_business_flight', to: 'flights#selected_business_flight', as: 'selected_business_flight'
  get 'flights/passenger', to: 'flights#passenger'
  get 'bookings/booking_failed', to: "bookings#booking_failed", as: 'booking_failed'

  resources :tickets, :bookings, :transfers
  resources :payment_provider_operations, defaults: { format: 'plain' }
  get 'admin/home', to: 'pages#home', as: 'admin_home'
  get 'airports/get_airport/:id', to: 'airports#get_airport'
  scope '/admin' do
    resources :flights, :airports, :airplanes, :users, :bookings
  end

  match '*unmatched', to: 'application#route_not_found', via: :all

end
