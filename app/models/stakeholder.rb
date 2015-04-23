class Stakeholder < ActiveRecord::Base
  has_many :legislative_stakeholders
  has_many :legislatives, through: :legislative_stakeholders

  mount_uploader :avatar, AvatarUploader

  scope :authors, -> { joins(:legislative_stakeholders).merge(LegislativeStakeholder.authors) }
  scope :speakers, -> { joins(:legislative_stakeholders).merge(LegislativeStakeholder.speakers) }
end
