class AddProjectRuleToStories < ActiveRecord::Migration
  def change
    add_column :stories, :project_rule, :string
  end
end
