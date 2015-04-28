class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.text :body
      t.date :event_at
      t.time :time
      t.references :legislative, index: true

      t.timestamps null: false
    end
    add_foreign_key :agendas, :legislatives
  end
end
