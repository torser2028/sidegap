class CreateExecutives < ActiveRecord::Migration
  def change
    create_table :executives do |t|
      t.text :title
      t.string :number
      t.string :kind
      t.string :institution
      t.date :filing_at

      t.timestamps null: false
    end
  end
end
