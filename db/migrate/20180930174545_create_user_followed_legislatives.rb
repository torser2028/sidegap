class CreateUserFollowedLegislatives < ActiveRecord::Migration
  def change
    create_table :user_followed_legislatives do |t|
      t.references :user, index: true
      t.references :legislative, index: true
      t.datetime :follow_date
      t.datetime :unfollow_date
      t.boolean :followed, default: false
      t.boolean :unfollowed, default: false

      t.timestamps null: false
    end
    add_foreign_key :user_followed_legislatives, :users
    add_foreign_key :user_followed_legislatives, :legislatives
  end
end
