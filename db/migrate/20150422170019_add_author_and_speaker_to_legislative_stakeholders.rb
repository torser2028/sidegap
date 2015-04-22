class AddAuthorAndSpeakerToLegislativeStakeholders < ActiveRecord::Migration
  def change
    add_column :legislative_stakeholders, :author, :boolean
    add_column :legislative_stakeholders, :speaker, :boolean
  end
end
