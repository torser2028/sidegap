class Agenda < ActiveRecord::Base
  belongs_to :legislative
  validates :body, :event_at, :time, presence: true

  scope :active, -> { where("event_at >= ?", Date.today) }
end
