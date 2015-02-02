class AccountController < ApplicationController

	def recover
	end

	def password
		@user = User.find_by_email(params[:email])
		@new_password = SecureRandom.base64(6)
		@user.password =  @new_password
		if @user.save
			Medimailer.recover_account_email(@user,@new_password).deliver
		end
		redirect_to root_path
	end
end
