class AddStatusToStakeholder < ActiveRecord::Migration
  def change
    add_column :stakeholders, :status, :boolean, default: true
  end
end
