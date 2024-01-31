Rails.application.routes.draw do
  root 'home#show'

  patch "profile", to: "profile#update", as: :profile

  # Feature flipping
  post   'features/enable/:feature',  to: "features#create",  as: :enable
  delete 'features/disable/:feature', to: "features#destroy", as: :disable

  # The demo pages which use feature toggles to unlock the next step...
  post 'demo/reset'
  get 'demo/start'
  get 'demo/actor'
  get 'demo/group'
  get 'demo/percentage'

  # The example pages
  get 'example/index', as: :examples
  get 'example/:slug', to: "example#show", as: :example


  # The Flipper UI gem interface.
  #
  # IMPORTANT: In production, you'd want to limit access to this, or anybody would be able to
  #   control your feature toggles.
  #
  # More info on Flipper UI Security & Authorization:
  #   https://www.flippercloud.io/docs/ui#security
  mount Flipper::UI.app(Flipper) => '/flipper'
end
