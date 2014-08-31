class User < ActiveRecord::Base
	has_secure_password
	belongs_to :account
	validates_uniqueness_of :email	
	before_create { generate_token(:auth_token) }

	mount_uploader :image, ImageUploader

	def full_name
		[ first_name, last_name ].join(' ')
	end

	def full_name=(name)
  	split = name.split(' ', 2)
  	self.first_name = split.first
  	self.last_name = split.last
	end

	def role_name
		case self.role
			when 0 then "super"
			when 1 then "owner"
			when 2 then "admin"
			when 3 then "user"
			else "invalid"
		end
	end

	private

	def generate_token(column)
	  begin
	    self[column] = SecureRandom.urlsafe_base64
	  end while User.exists?(column => self[column])
	end
	
end
