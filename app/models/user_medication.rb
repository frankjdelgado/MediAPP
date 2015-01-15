class UserMedication < ActiveRecord::Base
  belongs_to :user
  belongs_to :medication
  belongs_to :unit
  belongs_to :medication_type
end
