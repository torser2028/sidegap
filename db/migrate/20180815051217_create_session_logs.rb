class CreateSessionLogs < ActiveRecord::Migration
  def change
    create_table :session_logs do |t|
      t.string :email
      t.string :ip_address

      t.timestamps null: false
    end
  end
end
