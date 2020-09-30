class CreateRemovedEvents < ActiveRecord::Migration
  def change
    create_table :removed_events do |t|
      t.string :events_ids
      t.string :day

      t.timestamps null: false
    end
  end
end
