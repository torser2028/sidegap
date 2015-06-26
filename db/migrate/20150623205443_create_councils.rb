class CreateCouncils < ActiveRecord::Migration
  def change
    create_table :councils do |t|
      t.text :title
      t.string :number
      t.string :commission
      t.string :status
      t.string :topic
      t.date :filing_at
      t.boolean :notify
      t.boolean :warning

      t.timestamps null: false
    end
  end
end
