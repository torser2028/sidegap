class UserFollowedLegislative < ActiveRecord::Base
  belongs_to :user
  belongs_to :legislative

  scope :followed, -> { where(followed: true, follow_date: Date.today.beginning_of_week.beginning_of_day..Date.today.end_of_week.end_of_day) }
  scope :unfollowed, -> { where(unfollowed: true, unfollow_date: Date.today.beginning_of_week.beginning_of_day..Date.today.end_of_week.end_of_day) }
end
