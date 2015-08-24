class AddLastStatusToLegislatives < ActiveRecord::Migration
  def change
    add_column :legislatives, :last_status, :string
  end
end
