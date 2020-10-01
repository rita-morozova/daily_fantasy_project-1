Rails.application.routes.draw do
  get "/users/users_contests", to: "users#users_contests"
  resources :weeks
  resources :teams, except: :index
  resources :contests
  resources :users
  get '/players/analytics', to: "players#analytics"
  resources :players, only: [:show, :index] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get '/users/:id/wishlist', to: 'users#wishlist'

  get '/', to: 'contests#index'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  post "/logout", to: "sessions#destroy"
  
 

  
end
