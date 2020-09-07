class Event < ActiveRecord::Base
  acts_as_followable
  acts_as_votable

  scope :active, -> { where('event_at >= ?', Date.today) }
  scope :inactive, -> { where('event_at < ? OR status IS FALSE', Date.today) }
  scope :active_and_past_week, -> { where('event_at >= ?', Date.today - 1.week) }
  scope :past_week, -> { where('event_at > ? AND event_at <= ?', (Date.today - 1.week), Date.today) }
  scope :next_week, -> { where('event_at > ? AND event_at <= ?', Date.today, (Date.today + 1.week)) }
  scope :status_active, -> { where(status: true) }
  scope :status_inactive, -> { where(status: false) }
end
