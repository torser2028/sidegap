class Sector < ActiveRecord::Base
  default_scope { order(name: :asc) }
  has_many :institutions, dependent: :destroy
end
