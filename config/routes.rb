Rails.application.routes.draw do
  # Session
  root 'session#login'
  get 'signout', to: 'session#destroy', as: :logout
  post 'signup', to: 'session#create'

  resources :user
  resources :medication

  get 'test', to: 'user#test'
end
