class Agenda < ActiveRecord::Base
  belongs_to :legislative
  validates :body, :event_type, :event_at, :time, presence: true

  scope :active, -> { where("event_at >= ?", Date.today) }
  scope :inactive, -> { where("event_at <= ?", Date.today) }
end
