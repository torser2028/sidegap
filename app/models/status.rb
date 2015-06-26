class Status < ActiveRecord::Base
  scope :councils, -> { where(council: true) }
  scope :legislatives, -> { where(legislative: true) }
end
