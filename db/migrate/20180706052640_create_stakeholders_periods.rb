class CreateStakeholdersPeriods < ActiveRecord::Migration
  def change
    create_table :stakeholders_periods do |t|
      t.references :stakeholder, index: true
      t.references :period, index: true
      t.string :political_party
      t.string :job
      t.string :commission
      t.string :region
    end
    add_foreign_key :stakeholders_periods, :stakeholders
    add_foreign_key :stakeholders_periods, :periods
  end
end
