class Notice < ActiveRecord::Base
  time_range = ((Time.now - 7.day)..Time.now.midnight + 1.day)
  scope :actual, -> { where(created_at: time_range) }
end
