class User < ActiveRecord::Base
    has_many :tutorials
    has_many :comments
end
