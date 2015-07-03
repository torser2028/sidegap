class RemoveLawFromLegislatives < ActiveRecord::Migration
  def change
    remove_column :legislatives, :law, :boolean
  end
end
