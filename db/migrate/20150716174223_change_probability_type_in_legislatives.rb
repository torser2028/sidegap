class ChangeProbabilityTypeInLegislatives < ActiveRecord::Migration
  def change
    remove_column :legislatives, :probability, :string
    add_column :legislatives, :probability, :integer
  end
end
