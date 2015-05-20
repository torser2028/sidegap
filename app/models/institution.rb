class Institution < ActiveRecord::Base
  default_scope { order(name: :asc) }
  belongs_to :sector
end
