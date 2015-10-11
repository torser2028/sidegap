class Institution < ActiveRecord::Base
  belongs_to :sector
  has_many :rules
  default_scope { where(rule: true).order(name: :asc) }
  scope :executives, -> { where(executive: true) }
  scope :rules, -> { where(rule: true) }
end
