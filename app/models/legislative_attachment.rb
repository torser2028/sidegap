class LegislativeAttachment < ActiveRecord::Base
  belongs_to :legislative
  mount_uploader :attachment, AttachmentUploader
end
