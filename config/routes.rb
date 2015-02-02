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
	get 'medications', to: 'medication#medications', as: 'medications'

	resources :treatment do
		collection do
			put 'last_taken'
		end 
	end

	get 'recover', to: 'account#recover', as: 'recover'
	post 'password_reset', to: 'account#password', as: 'password_reset'

end
