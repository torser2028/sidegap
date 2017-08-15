class Notice < ActiveRecord::Base

  belongs_to :user
  
  validates :body, :user, presence: true

  time_range = Date.today.beginning_of_week.beginning_of_day..Date.today.end_of_week.end_of_day
  scope :actual, -> { where(created_at: time_range) }
end
