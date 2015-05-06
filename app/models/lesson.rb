class Lesson < ActiveRecord::Base
  belongs_to :tutorial
  has_many :completed_lessons
  has_many :users, through: :completed_lessons
end
