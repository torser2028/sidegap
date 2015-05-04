class AddNameToSectors < ActiveRecord::Migration
  def change
    add_column :sectors, :name, :string
  end
end
