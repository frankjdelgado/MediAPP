Rails.application.routes.draw do
  root 'session#login'
  resources :user
end
