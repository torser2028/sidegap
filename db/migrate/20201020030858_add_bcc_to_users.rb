class AddBccToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bcc, :string
  end
end
