class Notice < ActiveRecord::Base

  belongs_to :user
  
  validates :body, :user, presence: true

  time_range = Date.today.beginning_of_week..Date.today.end_of_week
  scope :actual, -> { where(created_at: time_range) }
end
