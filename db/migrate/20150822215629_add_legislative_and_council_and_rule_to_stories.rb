class AddLegislativeAndCouncilAndRuleToStories < ActiveRecord::Migration
  def change
    add_column :stories, :legislative, :boolean, default: false
    add_column :stories, :council, :boolean, default: false
    add_column :stories, :rule, :boolean, default: false
  end
end
