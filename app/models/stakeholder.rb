class Stakeholder < ActiveRecord::Base
  has_many :legislative_stakeholders, dependent: :destroy
  has_many :legislatives, through: :legislative_stakeholders
  has_many :stakeholders_periods
  has_many :periods, through: :stakeholders_periods

  accepts_nested_attributes_for :stakeholders_periods, allow_destroy: true

  mount_uploader :avatar, AvatarUploader

  default_scope { order(name: :asc) }
  scope :senate_authors, -> { joins(:legislative_stakeholders).merge(LegislativeStakeholder.senate_authors).uniq }
  scope :senate_speakers, -> { joins(:legislative_stakeholders).merge(LegislativeStakeholder.senate_speakers).uniq }
  scope :chamber_authors, -> { joins(:legislative_stakeholders).merge(LegislativeStakeholder.chamber_authors).uniq }
  scope :chamber_speakers, -> { joins(:legislative_stakeholders).merge(LegislativeStakeholder.chamber_speakers).uniq }
  scope :authors, -> { joins(:legislative_stakeholders).merge(LegislativeStakeholder.authors).uniq }
  scope :speakers, -> { joins(:legislative_stakeholders).merge(LegislativeStakeholder.speakers).uniq }
  scope :active, -> { where(status: true) }
  scope :inactive, -> { where(status: false) }

  ADDRESSES = [
    "Capitolio Nacional, Calle 10 N° 7-50",
    "Ed. Nuevo del Congreso, Carrera 7 N° 8 - 68"
  ]

  def show_periods
    stakeholders_periods.map(&:period).collect(&:name).join(' / ')
  end
end
