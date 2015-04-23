class Stakeholder < ActiveRecord::Base
  has_many :legislative_stakeholders
  has_many :legislatives, through: :legislative_stakeholders

  mount_uploader :avatar, AvatarUploader

  scope :authors, -> { joins(:legislative_stakeholders).merge(LegislativeStakeholder.authors).uniq }
  scope :speakers, -> { joins(:legislative_stakeholders).merge(LegislativeStakeholder.speakers).uniq }
end
