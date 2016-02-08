class AddFieldsToAlertsAndCouncils < ActiveRecord::Migration
  def change
  	add_column :regulatory_alerts, :project_rule, :string

  	add_column :councils, :commission_at, :date
  	add_column :councils, :plenary_at, :date
  	add_column :councils, :observation, :text
  end
end
