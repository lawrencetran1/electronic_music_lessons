class CreateLessonsUsers < ActiveRecord::Migration
  def change
    create_table :lessons_users, id: false do |t|
    	t.belongs_to :lesson, index: true
    	t.belongs_to :user, index: true
    end
  end
end
