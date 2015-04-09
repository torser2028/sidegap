class Legislative < ActiveRecord::Base
  has_many :legislative_attachments
  accepts_nested_attributes_for :legislative_attachments
end
