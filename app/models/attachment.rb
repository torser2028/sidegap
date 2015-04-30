class Attachment < ActiveRecord::Base
  belongs_to :executive
  belongs_to :legislative

  mount_uploader :attachment, AttachmentUploader

  scope :legislatives, -> { where.not(legislative: nil) }
  scope :executives, -> { where.not(executive: nil) }
end
