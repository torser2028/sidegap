class AddWarningToLegislatives < ActiveRecord::Migration
  def change
    add_column :legislatives, :warning, :boolean, default: false
  end
end
