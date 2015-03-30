class AddAreaToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :area, index: true
    add_foreign_key :users, :areas
  end
end
