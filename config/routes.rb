Rails.application.routes.draw do
  root 'session#login'
  post 'signin', to: 'session#create'
  get 'signout', to: 'session#destroy', as: :logout

  resources :user
end
