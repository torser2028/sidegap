class CreateRegulatoryAlerts < ActiveRecord::Migration
  def change
    create_table :regulatory_alerts do |t|
      t.string :title
      t.text :body
      t.date :filing_at

      t.timestamps null: false
    end
  end
end
