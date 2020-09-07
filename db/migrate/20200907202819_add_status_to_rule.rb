class AddStatusToRule < ActiveRecord::Migration
  def change
    add_column :rules, :status, :boolean, default: true
  end
end
