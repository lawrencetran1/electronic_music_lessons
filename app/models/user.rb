class User < ActiveRecord::Base
    has_many :tutorials
    has_many :comments
    has_many :identities
    has_many :progresses, as: :status
end
