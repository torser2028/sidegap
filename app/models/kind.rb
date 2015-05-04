class Kind < ActiveRecord::Base
  scope :executives, -> { where(executive: true) }
end
