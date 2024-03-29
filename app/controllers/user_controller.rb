class UserController < ApplicationController

	before_action :detect_mobile
	
	def new

		@user = User.new
	end

	def create

		user = User.new(user_params)

		if user.save
			Medimailer.send_signup_email(user).deliver
			redirect_to root_path			
		else
			redirect_to root_path
		end
		
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		if @user.update(update_params)
			redirect_to controller: :user, action: :edit
		else
			flash[:errors] = @user.errors.full_messages
			redirect_to controller: :user, action: :edit
		end
	end

	def password
		@user = current_user
		if @user.update(password_params)
			redirect_to controller: :user, action: :edit
		else
			redirect_to controller: :user, action: :edit
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :name, :password, :password_confirmation)

	end

	def update_params
		params.permit(:email, :name, :password, :password_confirmation)

	end

end
