class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.string :name
      t.string :description
      t.string :category
      t.string :picture 
      t.timestamps null: false
    end
  end
end
