class CreateUserNotifications < ActiveRecord::Migration
  def change
    create_table :user_notifications do |t|
      t.references :user, index: true
      t.references :institution, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_notifications, :users
    add_foreign_key :user_notifications, :institutions
  end
end
