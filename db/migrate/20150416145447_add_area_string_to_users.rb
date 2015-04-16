class AddAreaStringToUsers < ActiveRecord::Migration
  def change
    add_column :users, :area, :string
  end
end
