class User < ActiveRecord::Base
		has_secure_password

    has_many :comments
    has_many :tutorials
    has_many :completed_lessons
    has_many :lessons, through: :completed_lessons

		# Checks if email exists and if email format is correct
		validates :email, presence: true, uniqueness: { case_sensitive: false }, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}

		# Checks if password is between 6 and 20 characters long
		validates :password, presence: true, length: { in: 6..20 }    

	def self.from_omniauth(auth)
		where({:provider => auth['provider'], :uid => auth['uid']}).first_or_initialize.tap do |user|
			user.provider = auth['provider']
			user.uid = auth['uid']
			user.email = auth['info']['email']
			user.first_name = auth['info']['first_name']
			user.last_name = auth['info']['last_name']
			user.image = auth['info']['image']
			user.name = auth['info']['name']
			password = ""
			72.times do
				password << rand(9)
			end
			user.password = password
			user.oauth_token = auth['credentials']['token']
			user.oauth_expires_at = Time.at(auth['credentials']['expires_at'])
			user.save!
		end
	end
	      
end
