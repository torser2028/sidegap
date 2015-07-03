class Stakeholder < ActiveRecord::Base
  has_many :legislative_stakeholders
  has_many :legislatives, through: :legislative_stakeholders

  mount_uploader :avatar, AvatarUploader

  default_scope { order(name: :asc) }
  scope :senate_authors, -> { joins(:legislative_stakeholders).merge(LegislativeStakeholder.senate_authors).uniq }
  scope :senate_speakers, -> { joins(:legislative_stakeholders).merge(LegislativeStakeholder.senate_speakers).uniq }
  scope :chamber_authors, -> { joins(:legislative_stakeholders).merge(LegislativeStakeholder.chamber_authors).uniq }
  scope :chamber_speakers, -> { joins(:legislative_stakeholders).merge(LegislativeStakeholder.chamber_speakers).uniq }

  ADDRESSES = [
    "Capitolio Nacional, Calle 10 N° 7-50",
    "Ed. Nuevo del Congreso, Carrera 7 N° 8 - 68"
  ]
end
