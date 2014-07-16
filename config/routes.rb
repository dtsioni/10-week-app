Rails.application.routes.draw do
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :posts do
    resources :comments
  end

  get '/home', to: 'pages#home'
  
  root 'pages#home'
  
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  
end
