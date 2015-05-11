class Kind < ActiveRecord::Base
  scope :executives, -> { where(executive: true) }
  scope :judicials, -> { where(judicial: true) }
end
