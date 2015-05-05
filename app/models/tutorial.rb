class Tutorial < ActiveRecord::Base
    belongs_to :user
    has_many :lessons
    has_many :comments
end
