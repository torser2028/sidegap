class CreateJudicials < ActiveRecord::Migration
  def change
    create_table :judicials do |t|
      t.text :title
      t.string :number
      t.string :kind
      t.date :filing_at
      t.string :court
      t.string :room
      t.string :type

      t.timestamps null: false
    end
  end
end
