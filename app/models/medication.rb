class Medication < ActiveRecord::Base
	has_many :treatments
end
