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
	      	session[:user] = user
			redirect_to controller: :medication, action: :index
	    else
	    	redirect_to :login
	    end
	end

end
