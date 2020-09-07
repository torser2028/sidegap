class Agenda < ActiveRecord::Base
  belongs_to :legislative
  validates :body, :event_type, :event_at, :time, presence: true

  scope :active, -> { where('event_at >= ?', Date.today) }
  scope :inactive, -> { where('event_at < ? OR status IS FALSE', Date.today.end_of_week) }
  scope :past_week, -> { where('event_at > ? AND event_at <= ?', Date.today.last_week, Date.today.last_week.end_of_week) }
  scope :status_active, -> { where(status: true) }
  scope :status_inactive, -> { where(status: false) }
end
