class LegislativeAttachmentChange < ActiveRecord::Base
  belongs_to :legislative
  belongs_to :attachment
end
