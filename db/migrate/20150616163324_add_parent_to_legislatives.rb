class AddParentToLegislatives < ActiveRecord::Migration
  def change
    add_reference :legislatives, :legislative, index: true
    add_foreign_key :legislatives, :legislatives
  end
end
