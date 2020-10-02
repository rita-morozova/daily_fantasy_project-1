Rails.application.routes.draw do
  get "/users/users_contests", to: "users#users_contests"
  # resources :weeks
  resources :teams, except: :index
  resources :contests
  resources :users
  get '/players/analytics', to: "players#analytics"
  resources :players, only: [:show, :index] 
  get '/', to: 'contests#index'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  post "/logout", to: "sessions#destroy"
  get "/add_balance", to: "users#add_balance"
  patch "/post_balance", to: "users#post_balance", as: "post_balance"
  
end
