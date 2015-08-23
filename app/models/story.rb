class Story < ActiveRecord::Base
  scope :latest, -> { order(created_at: :desc).limit(6) }
  scope :sent, -> { where(sent: true) }
  scope :not_sent, -> { where(sent: false) }
  scope :legislatives, -> { where(legislative: true) }
  scope :councils, -> { where(council: true) }
  scope :rules, -> { where(rule: true) }
end
