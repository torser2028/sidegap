class Period < ActiveRecord::Base
  has_many :stakeholders_periods
  validates :name, presence: true
end
