class AddObservationToEvents < ActiveRecord::Migration
  def change
    add_column :events, :observation, :text
  end
end
