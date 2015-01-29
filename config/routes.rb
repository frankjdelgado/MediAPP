Rails.application.routes.draw do
  # Session
  root 'session#login'
  get 'signout', to: 'session#destroy', as: :logout
  post 'signup', to: 'session#create'

  resources :user
  
  resources :medication do
		collection do
			get 'autocomplete'
		end 
	end

end
