class Council < ActiveRecord::Base
  acts_as_followable
  acts_as_votable

  has_many :attachments
  has_many :comments
  has_many :councillor_assignments
  has_many :councillors, through: :councillor_assignments

  accepts_nested_attributes_for :attachments, :councillor_assignments, allow_destroy: true

  scope :as_author, -> { joins(:councillor_assignments).merge(CouncillorAssignment.authors).uniq }
  scope :as_speaker, -> { joins(:councillor_assignments).merge(CouncillorAssignment.speakers).uniq }

end
