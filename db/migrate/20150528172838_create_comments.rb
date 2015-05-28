class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :impact
      t.references :legislative, index: true
      t.references :rule, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :legislatives
    add_foreign_key :comments, :rules
    add_foreign_key :comments, :users
  end
end
