class AddNewProjectToLegislatives < ActiveRecord::Migration
  def change
    add_column :legislatives, :new_project, :boolean, default: true
  end
end
