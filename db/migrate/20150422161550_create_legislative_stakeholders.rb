class CreateLegislativeStakeholders < ActiveRecord::Migration
  def change
    create_table :legislative_stakeholders do |t|
      t.references :legislative, index: true
      t.references :stakeholder, index: true

      t.timestamps null: false
    end
    add_foreign_key :legislative_stakeholders, :legislatives
    add_foreign_key :legislative_stakeholders, :stakeholders
  end
end
