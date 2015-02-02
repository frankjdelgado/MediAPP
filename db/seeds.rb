# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
# cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# Mayor.create(name: 'Emanuel', city: cities.first)

Frequency.delete_all
MedicationType.delete_all
Medication.delete_all
Unit.delete_all
User.delete_all
Treatment.delete_all
PasswordReminder.delete_all

10.times do |i|
	Frequency.create(value: " #{i} Veces al dia")
end

9.times do |i|
	MedicationType.create(value: "Veneno/formula N##{i}")
end

9.times do |i|
	Medication.create(
					:name => "Sustancia X#{i}" ,
					:description => "con esta sustancia puedes hacer #{i+3} chicas superpoderosas",
				)
end

Medication.create(:name => "Vicodion" , :description => "Powerfull painkiller")
Medication.create(:name => "Acetaminofen" , :description => "Anti-Flu medicine")
Medication.create(:name => "Malox" , :description => "Medicine for stomach-ache")
Medication.create(:name => "Insuline" , :description => "Health supplement against diabetus")
Medication.create(:name => "Cortisol" , :description => "Awesome does it all medicine")
Medication.create(:name => "Peniciline" , :description => "Fungus based medicine against deseases")
Medication.create(:name => "Festal" , :description => "Digestive")

9.times do |i|
	Unit.create(value: " #{i} capsulas")
end

9.times do |i|
	User.create(name: "usuario #{i}" , email: "correo#{i}@gmail.com", password: "123456")
end

	
9.times do |i|
	Treatment.create(
					start: DateTime.now.to_date ,
					finish: DateTime.now.midnight, 
					hour: 10.minutes.ago.strftime("%I:%m %p"),
					frequency: 1,
					frequency_id: Frequency.last.id,
					user_id: User.first.id,
					medication_id: Medication.first.id,
					unit_id: Unit.first.id,
					medication_type_id: MedicationType.last.id
				)
 end

	# Treatment.create( 	start: DateTime.now.to_date ,		finish: DateTime.now.midnight, 	  hour: 10.minutes.ago,	  frecuency_id: Frequency.last.id,	  user_id: User.first.id,	  medication_id: Medication.first.id,	  unit_id: Unit.first.id,	  medication_type_id: MedicationType.last.id	 )

	   #frecuency: 1,  #should exist?	
Time.now
Treatment.create(start: DateTime.now.to_date ,finish: DateTime.now.midnight, hour: Time.now.strftime("%I:%m %p").to_s,frequency: 1,frequency_id: Frequency.last.id,user_id: User.first.id,medication_id: Medication.first.id,unit_id: Unit.first.id,medication_type_id: MedicationType.last.id)