class RemoveAreaFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :area, :string
  end
end
