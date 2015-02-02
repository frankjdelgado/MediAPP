class Medimailer < ActionMailer::Base

   # default from: ENV["GMAIL_USERNAME"]
	 default from:"torreta.sendgrid.net"

  def pill_time_email (user_id,treatment)
  	@user = User.find_by_id(user_id)
  	@treatment = treatment

  	#si no me equivoco, este puede ser un buen comienzo  Medication.find_by_id(Treatment.find_by_id(1).id).name

  	mail(to: @user.email, subject: "Its time to take your medicine #{(Medication.find_by_id(treatment.medication_id)).name}")

  end

  def send_signup_email (user)
   @user = user
   mail(to: @user.email, subject: "Thanks for signing up to our service")
  end

  def recover_acount_email (user, password)
    @user = user
    @password = password
    mail(to: @user.email, subject: "Password Reset")
  end

end
