class CreateMailLogs < ActiveRecord::Migration
  def change
    create_table :mail_logs do |t|
      t.string :email
      t.string :subject
      t.text :options

      t.timestamps null: false
    end
  end
end
