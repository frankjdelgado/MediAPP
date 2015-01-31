Rails.application.routes.draw do
  # Session
  root 'session#login'
  get 'signout', to: 'session#logout', as: :logout
  post 'signup', to: 'session#create'

  resources :user
  
  resources :medication do
		collection do
			get 'autocomplete'
		end 
	end

end
