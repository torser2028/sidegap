class AddNotifyToLegislatives < ActiveRecord::Migration
  def change
    add_column :legislatives, :notify, :boolean, default: false
  end
end
