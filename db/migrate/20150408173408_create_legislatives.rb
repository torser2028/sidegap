class CreateLegislatives < ActiveRecord::Migration
  def change
    create_table :legislatives do |t|
      t.string :title
      t.string :source
      t.string :chamber_number
      t.string :senate_number
      t.string :commission
      t.string :status
      t.string :final_status
      t.string :topic
      t.string :law
      t.string :probability
      t.date :senate_commission_at
      t.date :senate_plenary_at
      t.date :chamber_commission_at
      t.date :chamber_plenary_at
      t.date :filing_at

      t.timestamps null: false
    end
  end
end
