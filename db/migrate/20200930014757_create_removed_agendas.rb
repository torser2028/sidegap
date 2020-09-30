class CreateRemovedAgendas < ActiveRecord::Migration
  def change
    create_table :removed_agendas do |t|
      t.string :agendas_ids
      t.string :day

      t.timestamps null: false
    end
  end
end
