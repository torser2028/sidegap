class AddMonitoringAtAndAvalToCouncils < ActiveRecord::Migration
  def change
    add_column :councils, :monitoring_at, :date
    add_column :councils, :aval, :boolean
  end
end
