class AddSignInCountToSessionLog < ActiveRecord::Migration
  def change
    add_column :session_logs, :daily_sing_in_count, :integer
  end
end
