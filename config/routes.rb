Rails.application.routes.draw do
  root 'home#show'

  mount Flipper::Cloud.app, at: "_flipper"
end
