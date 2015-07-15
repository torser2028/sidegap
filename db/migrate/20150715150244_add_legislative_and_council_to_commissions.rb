class AddLegislativeAndCouncilToCommissions < ActiveRecord::Migration
  def change
    add_column :commissions, :legislative, :boolean, default: false
    add_column :commissions, :council, :boolean, default: false
  end
end
