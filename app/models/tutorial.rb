class Tutorial < ActiveRecord::Base
    belongs_to :user
    has_many :lessons
    has_many :comments
    has_many :progresses, as: :status
end
