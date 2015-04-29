class ChangeLegislativesTitle < ActiveRecord::Migration
  def up
    change_column :legislatives, :title, :text
  end

  def down
    change_column :legislatives, :title, :string
  end
end
