class Topic < ActiveRecord::Base
  default_scope { order(name: :asc) }
end
