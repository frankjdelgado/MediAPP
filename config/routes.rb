Rails.application.routes.draw do
  # Session
  root 'session#login'
  get 'signout', to: 'session#logout', as: :logout
  post 'signup', to: 'session#create'

  resources :user do
		collection do
			post 'password'
		end 
	end
  
  resources :medication do
		collection do
			get 'autocomplete'
		end 
	end

	resources :treatment

end
