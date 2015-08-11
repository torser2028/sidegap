class Event < ActiveRecord::Base
  scope :active, -> { where("event_at >= ?", Date.today) }
  scope :inactive, -> { where("event_at <= ?", Date.today) }
end
