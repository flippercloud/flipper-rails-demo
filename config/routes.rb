Rails.application.routes.draw do
  get "/:login", to: "application#test_login"
end
