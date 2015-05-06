class User < ActiveRecord::Base
		has_secure_password

    has_many :comments
    has_many :tutorials
    has_many :completed_lessons
    has_many :lessons, through: :completed_lessons

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
