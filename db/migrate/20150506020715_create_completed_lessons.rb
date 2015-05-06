class CreateCompletedLessons < ActiveRecord::Migration
  def change
    create_table :completed_lessons do |t|
      t.datetime :completed_date
      t.references :lesson, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
