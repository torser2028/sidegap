class AddJudicialToKind < ActiveRecord::Migration
  def change
    add_column :kinds, :judicial, :boolean, default: false
  end
end
