class SessionController < ApplicationController

	def login
		# login view
	end

	def logout
		# flush session
	end

	# POST. Create new session
	def create
		user = User.find_by_email(params[:email])

	    # If the user exists AND the password entered is correct.
	    if user && user.authenticate(params[:password])
	    	# Change user_id for entire user object?
	    	# save more user info like email?
	      	session[:user_id] = user.id
			# redirect_to controller: :nombre_controller, action: :nombre_action
	    else
	    	redirect_to :login
	    end
	end

end
