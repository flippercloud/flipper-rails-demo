Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root 'home#show'

  # Simple Registration
  get 'register',  to: "users#new",    as: :new_user
  post 'register', to: "users#create", as: :users

  # Simple Login/Logout
  get    'login',  to: "sessions#new",     as: :login
  post   'login',  to: "sessions#create",  as: :log_in
  delete 'logout', to: "sessions#destroy", as: :log_out
end
