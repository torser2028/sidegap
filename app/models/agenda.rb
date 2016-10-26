class Agenda < ActiveRecord::Base
  belongs_to :legislative
  validates :body, :event_type, :event_at, :time, presence: true

  scope :active, -> { where("event_at >= ?", Date.today.beginning_of_week) }
  scope :inactive, -> { where("event_at < ?", Date.today.end_of_week) }
  scope :past_week, -> { where("event_at > ? AND event_at <= ?", Date.today.last_week, Date.today.last_week.end_of_week) }
end
