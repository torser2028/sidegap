class Topic < ActiveRecord::Base
  default_scope { order(name: :asc) }
  scope :legislatives, -> { where(legislative: true) }
  scope :councils, -> { where(council: true) }
end
