class AddActiveToLegislatives < ActiveRecord::Migration
  def change
    add_column :legislatives, :active, :boolean, default: true
  end
end
