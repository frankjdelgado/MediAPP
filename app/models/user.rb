class User < ActiveRecord::Base

	# Relationships
	has_many :treatments

	# Bcrypt
	has_secure_password

	# Validations
	validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
	validates :password, length: {minimum: 6}


end
