class Agenda < ActiveRecord::Base
  belongs_to :legislative
  validates :body, :event_type, :event_at, :time, presence: true

  scope :active, -> { where("event_at >= ?", Date.today) }
  scope :inactive, -> { where("event_at < ?", Date.today) }
  scope :past_week, -> { where("event_at >= ? AND event_at < ?", (Date.today - 1.week), Date.today) }
end
