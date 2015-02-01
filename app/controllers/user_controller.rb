class UserController < ApplicationController

	before_action :detect_mobile
	
	def new

		@user = User.new
	end

	def create

		user = User.new(user_params)

		if user.save
			Medimailer.send_signup_email(@user).deliver
			# flash[:notice] = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio, vitae?"
			# redirect_to controller: :nombre_controller, action: :nombre_action
		else
			# flash[:warning] = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio, vitae?"
			# redirect_to controller: :nombre_controller, action: :nombre_action
		end
		
	end


	def test
		
	end

	private

	def user_params
		params.require(:user).permit(:email, :name, :password, :password_confirmation)
	end

end
