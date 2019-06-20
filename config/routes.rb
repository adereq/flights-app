Rails.application.routes.draw do
  resources :airports, :flights  
  get 'admin/home', to: 'pages#home', as: 'admin_home'
end
