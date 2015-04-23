class CreateLegislativeUsers < ActiveRecord::Migration
  def change
    create_table :legislative_users do |t|
      t.string :impact
      t.text :comment
      t.references :user, index: true
      t.references :legislative, index: true

      t.timestamps null: false
    end
    add_foreign_key :legislative_users, :users
    add_foreign_key :legislative_users, :legislatives
  end
end
