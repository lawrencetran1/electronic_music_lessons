class CreateTutorialsUsers < ActiveRecord::Migration
  def change
    create_table :tutorials_users, id: false do |t|
        t.belongs_to :tutorial, index: true
        t.belongs_to :user, index: true
    end
  end
end
