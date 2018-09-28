class CreateLegislativeStatuses < ActiveRecord::Migration
  def change
    create_table :legislative_statuses do |t|
      t.references :legislative, index: true
      t.string :last_week_status
      t.string :current_status
      t.datetime :date

      t.timestamps null: false
    end
    add_foreign_key :legislative_statuses, :legislatives
  end
end
