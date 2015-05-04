class RemoveTitleFromSectors < ActiveRecord::Migration
  def change
    remove_column :sectors, :title, :string
  end
end
