class AddNameAreaJobToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :area, :string
    add_column :users, :job, :string
  end
end
