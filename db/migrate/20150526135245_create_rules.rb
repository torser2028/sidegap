class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.text :title
      t.string :number
      t.string :kind
      t.date :filing_at
      t.references :institution, index: true

      t.timestamps null: false
    end
    add_foreign_key :rules, :institutions
  end
end
