Rails.application.routes.draw do
  
  resources :users
  
  resources :posts do
    resources :comments
  end

  get '/home', to: 'pages#home'
  get "", to: "pages#home"
  
  
end
