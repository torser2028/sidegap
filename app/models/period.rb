class Period < ActiveRecord::Base
  has_many :stakeholders_periods
  has_many :stakeholders, through: :stakeholders_periods
  validates :name, presence: true

  scope :active, -> { where(status: true).last }
end
