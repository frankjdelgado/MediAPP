class Medimailer < ActionMailer::Base
   # default from: ENV["GMAIL_USERNAME"]
	 default from:"torreta.sendgrid.net"

  def pill_time_email (user,treatment)
  	@user = user
  	@treatment = treatment

  	#si no me equivoco, este puede ser un buen comienzo
  	mail(to: @user.email, subject: " te toca tomarte #{(Medication.find_by_id(treatment.medication_id)).name}")

  end

 def send_signup_email (user)
	 @user = user
	 mail(to: @user.email, subject: "Thanks for signing up to our service")
 end


end
