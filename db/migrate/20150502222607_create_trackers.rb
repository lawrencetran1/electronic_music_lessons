class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.boolean :completed
      t.references :trackable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
