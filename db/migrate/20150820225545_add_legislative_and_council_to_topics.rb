class AddLegislativeAndCouncilToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :legislative, :boolean, default: false
    add_column :topics, :council, :boolean, default: false
  end
end
