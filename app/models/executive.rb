class Executive < ActiveRecord::Base
  acts_as_followable

  belongs_to :institution
  has_many :attachments

  accepts_nested_attributes_for :attachments, allow_destroy: true
end
