class Kind < ActiveRecord::Base
  default_scope { order(name: :asc) }
  scope :executives, -> { where(executive: true) }
  scope :judicials, -> { where(judicial: true) }
end
