class AddLocationFieldsToSessionLog < ActiveRecord::Migration
  def change
    add_column :session_logs, :location, :string
    add_column :session_logs, :coordinates, :string
  end
end
