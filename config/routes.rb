Rails.application.routes.draw do
  devise_for :users
  root to: 'flights#search'
  get 'search', to: 'flights#search'
  get 'availability', to: 'flights#availability'  
  get 'admin/tickets_list/:id', to: 'tickets#tickets_list', as: 'tickets_list'
  get 'selected_flight/:id', to: 'flights#selected_flight', as: 'selected_flight'
  get 'flights/passenger', to: 'flights#passenger'
 
  resources :tickets
  get 'admin/home', to: 'pages#home', as: 'admin_home'
  get 'airports/get_airport/:id', to: 'airports#get_airport'

  scope '/admin' do
    resources :flights, :airports, :airplanes
  end
end
