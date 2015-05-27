class AddRuleAndExecutiveToInstitutions < ActiveRecord::Migration
  def change
    add_column :institutions, :rule, :boolean, default: false
    add_column :institutions, :executive, :boolean, default: false
  end
end
