class AddSentAtFieldToStories < ActiveRecord::Migration
  def change
  	add_column :stories, :sent_at, :datetime
  end
end
