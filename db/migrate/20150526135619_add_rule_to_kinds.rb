class AddRuleToKinds < ActiveRecord::Migration
  def change
    add_column :kinds, :rule, :boolean, default: false
  end
end
