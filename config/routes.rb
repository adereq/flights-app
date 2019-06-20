Rails.application.routes.draw do
  root to: 'user_pages#index'
  resources :airports, :flights  
  get 'admin/home', to: 'pages#home', as: 'admin_home'
  get 'airports/get_airport/:id', to: 'airports#get_airport'
end
