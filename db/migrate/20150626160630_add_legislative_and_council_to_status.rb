class AddLegislativeAndCouncilToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :legislative, :boolean, default: false
    add_column :statuses, :council, :boolean, default: false
  end
end
