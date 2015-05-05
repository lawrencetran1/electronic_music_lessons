class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.references :user

      t.timestamps null: false
    end

    add_index :identities, :user_id
  end
end
