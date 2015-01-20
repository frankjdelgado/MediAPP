class User < ActiveRecord::Base
	has_many :treatments
end
