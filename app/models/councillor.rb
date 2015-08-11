class Councillor < ActiveRecord::Base
  has_many :councillor_assignments, dependent: :destroy
  has_many :councils, through: :councillor_assignments

  mount_uploader :avatar, AvatarUploader

  default_scope { order(name: :asc) }
  scope :authors, -> { joins(:councillor_assignments).merge(CouncillorAssignment.authors).uniq }
  scope :speakers, -> { joins(:councillor_assignments).merge(CouncillorAssignment.speakers).uniq }
end
