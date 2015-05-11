class Attachment < ActiveRecord::Base
  belongs_to :executive
  belongs_to :legislative
  belongs_to :judicial

  mount_uploader :attachment, AttachmentUploader

  scope :legislatives, -> { where.not(legislative: nil) }
  scope :executives, -> { where.not(executive: nil) }
  scope :judicials, -> { where.not(judicial: nil) }
end
