task :check	=> :environment do 
	@tempo = Time.now
	puts "checking mails at #{@tempo}"

	@treatments = Treatment.all
	@i = 0
	@treatments.each do |treatment|

		if treatment.hour == Time.now.strftime("%I:%m %p")
			Medimailer.pill_time_email(treatment.user_id,treatment)
			@i= @i + 1
		end

	end
	puts "Ended checking mails at #{Time.now}, sent #{@i} mails "
	@i=0

end

#Treatment(id: integer, start: date, finish: date,
 # hour: string, frequency_quantity: integer, frequency_id: integer,
 #  user_id: integer, medication_id: integer, unit_id: integer, 
 #  medication_type_id: integer, created_at: datetime, updated_at: datetime) 