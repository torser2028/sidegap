class Notice < ActiveRecord::Base
  time_range = Date.today.beginning_of_week..Date.today.end_of_week
  scope :actual, -> { where(created_at: time_range) }
end
