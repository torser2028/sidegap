class RemoveSourceFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :source, :string
  end
end
