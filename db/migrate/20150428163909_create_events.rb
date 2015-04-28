class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :body
      t.date :event_at
      t.time :time
      t.string :source
      t.string :event_type

      t.timestamps null: false
    end
  end
end
