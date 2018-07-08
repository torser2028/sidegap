class ChangePeriodToName < ActiveRecord::Migration
  def change
    rename_column :periods, :period, :name
  end
end
