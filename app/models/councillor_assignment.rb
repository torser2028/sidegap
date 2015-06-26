class CouncillorAssignment < ActiveRecord::Base
  belongs_to :council
  belongs_to :councillor

  scope :authors, -> { where(author: true) }
  scope :speakers, -> { where(speaker: true) }

end
