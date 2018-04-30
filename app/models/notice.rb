class Notice < ActiveRecord::Base
  belongs_to :user

  validates :body, :user, :publish_date, presence: true

  time_range = Date.today.beginning_of_week(start_day = :monday).beginning_of_day..Date.today.end_of_week(start_day = :monday).end_of_day
  scope :actual, -> { where(publish_date: time_range) }
end
