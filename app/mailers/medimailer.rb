class Medimailer < ActionMailer::Base
  default from: ENV["GMAIL_USERNAME"]

  def pill_time_email (user,treatment)
  	@user = user
  	@treatment = treatment

  	#si no me equivoco, este puede ser un buen comienzo
  	mail(to: @user.email, subject: "Its time to take your medicine #{(Medication.find_by_id(treatment.medication_id)).name}")

  end



end
