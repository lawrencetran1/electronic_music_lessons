class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :category
      t.string :body
      t.string :picture
      t.references :tutorial, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
