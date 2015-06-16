class Story < ActiveRecord::Base
  belongs_to :legislative
  scope :latest, -> { order(created_at: :desc).limit(6) }
end
