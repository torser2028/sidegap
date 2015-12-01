class AddFieldsToAgendas < ActiveRecord::Migration
  def change
    add_column :agendas, :event_type, :string
    add_column :agendas, :observation, :text
  end
end
