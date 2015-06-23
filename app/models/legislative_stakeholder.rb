class LegislativeStakeholder < ActiveRecord::Base
  belongs_to :legislative
  belongs_to :stakeholder

  scope :senate_authors, -> { where(author: true).where(senate: true) }
  scope :senate_speakers, -> { where(speaker: true).where(senate: true) }
  scope :chamber_authors, -> { where(author: true).where(chamber: true) }
  scope :chamber_speakers, -> { where(speaker: true).where(chamber: true) }
  scope :authors, -> { where(author: true) }
  scope :speakers, -> { where(speaker: true) }
end
