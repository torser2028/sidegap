class RemoveLegislativeFromStories < ActiveRecord::Migration
  def change
    remove_column :stories, :legislative_id, :integer
  end
end
