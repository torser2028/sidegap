class AddCommissionAndPlenaryToEvents < ActiveRecord::Migration
  def change
    add_column :events, :commission, :string
    add_column :events, :plenary, :string
  end
end
