class PoliticalParty < ActiveRecord::Base
  default_scope { order(name: :asc) }
end
