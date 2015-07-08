class AddForCommentsToRules < ActiveRecord::Migration
  def change
    add_column :rules, :for_comments, :string
  end
end
