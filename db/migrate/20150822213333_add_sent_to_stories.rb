class AddSentToStories < ActiveRecord::Migration
  def change
    add_column :stories, :sent, :boolean, default: false
  end
end
