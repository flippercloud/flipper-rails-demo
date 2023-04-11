Rails.application.routes.draw do
  root 'home#show'

  # Simple Registration
  get 'register', to: "users#new", as: :new_user
  post 'register', to: "users#create", as: :users
end
