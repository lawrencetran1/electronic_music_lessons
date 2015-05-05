class User < ActiveRecord::Base
		has_secure_password
    has_many :tutorials
    has_many :lessons, through: :tutorials
    has_many :comments
    has_many :identities

    def self.create_with_omniauth(info)
    	create(name: info['name'])
    end
    
end
