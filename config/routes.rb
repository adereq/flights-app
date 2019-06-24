Rails.application.routes.draw do
  devise_for :users
  root to: 'user_pages#index'
  get 'flights/search', to: 'flights#search'
  get 'flights/result', to: 'flights#result'
  resources :airports, :flights  
  get 'admin/home', to: 'pages#home', as: 'admin_home'
  get 'airports/get_airport/:id', to: 'airports#get_airport'


end
