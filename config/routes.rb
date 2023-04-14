Rails.application.routes.draw do
  root 'home#show'

  # Simple Registration
  get 'register',  to: "users#new",    as: :new_user
  post 'register', to: "users#create", as: :users

  # Simple Login/Logout
  get    'login',  to: "sessions#new",     as: :login
  post   'login',  to: "sessions#create",  as: :log_in
  delete 'logout', to: "sessions#destroy", as: :log_out

  # Unprotected feature flipping
  post   'features/enable/:feature',  to: "features#create",  as: :enable
  delete 'features/disable/:feature', to: "features#destroy", as: :disable

  # The demo pages which use feature toggles to unlock the next step...
  get 'demo/actor'
  get 'demo/group'
  get 'demo/percentage'


  # The Flipper UI gem interface.
  #
  # IMPORTANT: In production, you'd want to limit access to this, or anybody would be able to
  #   control your feature toggles.
  #
  # More info on Flipper UI Security & Authorization:
  #   https://www.flippercloud.io/docs/ui#security
  mount Flipper::UI.app(Flipper) => '/flipper'
end
