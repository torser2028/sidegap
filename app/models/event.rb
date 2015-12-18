class Event < ActiveRecord::Base
  acts_as_followable
  acts_as_votable
  
  scope :active, -> { where("event_at >= ?", Date.today) }
  scope :inactive, -> { where("event_at <= ?", Date.today) }
  scope :active_and_past_week, -> { where("event_at >= ?", Date.today - 1.week) }
end
