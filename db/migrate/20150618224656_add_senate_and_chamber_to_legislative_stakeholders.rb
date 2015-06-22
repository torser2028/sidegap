class AddSenateAndChamberToLegislativeStakeholders < ActiveRecord::Migration
  def change
    add_column :legislative_stakeholders, :senate, :boolean, default: false
    add_column :legislative_stakeholders, :chamber, :boolean, default: false
  end
end
