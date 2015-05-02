class CreateProgesses < ActiveRecord::Migration
  def change
    create_table :progesses do |t|
      t.boolean :completed
      t.references :status, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
