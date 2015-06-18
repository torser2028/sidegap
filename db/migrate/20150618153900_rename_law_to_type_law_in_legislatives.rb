class RenameLawToTypeLawInLegislatives < ActiveRecord::Migration
  def change
    rename_column :legislatives, :law, :type_law
  end
end
