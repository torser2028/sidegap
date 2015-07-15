class Commission < ActiveRecord::Base
  scope :legislatives, -> { where(legislative: true) }
  scope :councils, -> { where(council: true) }
end
