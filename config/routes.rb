Rails.application.routes.draw do
  devise_for :users
  root to: 'flights#search'
  get 'search', to: 'flights#search'
  get 'availability', to: 'flights#availability'  
  get 'tickets_list', to: 'tickets#tickets_list'
  get 'selected_flight/:id', to: 'flights#selected_flight', as: 'selected_flight'
  get 'flights/passenger', to: 'flights#passenger'
 
  resources :airports, :flights, :tickets
  get 'admin/home', to: 'pages#home', as: 'admin_home'
  get 'airports/get_airport/:id', to: 'airports#get_airport'

end
