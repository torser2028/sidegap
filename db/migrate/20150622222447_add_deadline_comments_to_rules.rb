class AddDeadlineCommentsToRules < ActiveRecord::Migration
  def change
    add_column :rules, :deadline_comments, :date
  end
end
