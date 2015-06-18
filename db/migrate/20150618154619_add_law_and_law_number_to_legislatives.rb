class AddLawAndLawNumberToLegislatives < ActiveRecord::Migration
  def change
    add_column :legislatives, :law, :boolean, default: false
    add_column :legislatives, :law_number, :string
  end
end
