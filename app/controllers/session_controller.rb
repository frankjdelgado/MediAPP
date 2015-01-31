class SessionController < ApplicationController

	def login
		# login view
	end

	def logout
		session.delete(:user_id)
    	redirect_to '/'
	end

	# POST. Create new session
	def create
		user = User.find_by_email(params[:session][:email])

	    # If the user exists AND the password entered is correct.
	    if user && user.authenticate(params[:session][:password])
	      	session[:user_id] = user.id
			redirect_to controller: :medication, action: :index
	    else
	    	redirect_to :login
	    end
	end

end
