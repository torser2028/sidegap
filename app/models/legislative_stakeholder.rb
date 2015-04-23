class LegislativeStakeholder < ActiveRecord::Base
  belongs_to :legislative
  belongs_to :stakeholder

  scope :authors, -> { where(author: true) }
  scope :speakers, -> { where(speaker: true) }
end
