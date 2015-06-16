class AddLegislativeToStories < ActiveRecord::Migration
  def change
    add_reference :stories, :legislative, index: true
    add_foreign_key :stories, :legislatives
  end
end
