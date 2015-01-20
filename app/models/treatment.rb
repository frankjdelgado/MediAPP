class Treatment < ActiveRecord::Base
	belongs_to :user
	belongs_to :medication
	belongs_to :medication_type
	belongs_to :unit
	belongs_to :frecuency
end
